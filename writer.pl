#!/usr/bin/perl
#
# Copyright 2013 by Denis Erygin,
# denis.erygin@gmail.com
#

use JSON::XS;
use DBI;
use warnings;
use strict;

use constant {
    INSTANCE  => 11,      # Chernarus
    DB_NAME   => 'epoch', # Set database name
    DB_LOGIN  => 'dayz',  # Set database login
    DB_PASSWD => 'dayz',  # Set database password

    CACHE_DIR => $ENV{'PWD'}.'/cache/',
    INVENTORY => '[["ItemFlashlight","ItemMap","ItemGPS","MeleeCrowbar"],["ItemBandage","ItemPainkiller","ItemSodaPepsi","ItemSodaCoke","FoodbeefCooked"]]',
    BACKPACK  => '["DZ_Patrol_Pack_EP1",[],[]]',
    MODEL     => '"Survivor2_DZ"'
};

my $myPlayerCounter = 1;

my %FN_IPC  = (
    11  => \&h_player_counter,
    101 => \&h_load_player,
    103 => \&h_log_login,
    201 => \&h_player_update,
    202 => \&h_player_death,
    204 => \&h_player_disconnect,
    303 => \&h_object_update_inventory,
    304 => \&h_object_delete,
    305 => \&h_vehicle_moved,
    306 => \&h_vehicle_damaged,
    308 => \&h_object_publish,
    309 => \&h_object_uid_update_inventory,
    310 => \&h_object_uid_delete,
    
    398 => \&h_trade_object,
);

my $dbh   = connect_to_db();
my $coder = JSON::XS->new->ascii(1)->shrink(1)->allow_nonref(1)->max_depth(5)->max_size(1048576);

mkdir (CACHE_DIR) unless (-d CACHE_DIR);

init_traders           ();
init_objects_id        ();
init_objects           ();
init_default_player    ();
init_default_character ();
update_players_cache   ();

open (LOG, ">>dump.log") or die $!;
while (<STDIN>) {
    next if ($_ =~ m/Duplicate magazine/ || $_ =~ m/arrived from nonowner/);
    print STDERR $_;
    print LOG $_;

    if ($_ =~ m/CHILD:/) {
        chop;
        my ($pref, $data) = split /CHILD:/ => $_;
        my @arr = split /:/ => $data;
        my $cmd = $arr[0];
        next unless $cmd;
        
        my $fn = $FN_IPC{$cmd};
        $fn->(\@arr) if $fn;
    } else {
        init_login_uid ($_);
    }
}
close(LOG);

$dbh->disconnect;
exit;

#---------------------------------------------------------------------------
sub connect_to_db {
    my $dbh = DBI->connect('dbi:mysql:'.DB_NAME, DB_LOGIN, DB_PASSWD,
              {'PrintError' => 1, 'RaiseError' => 1, 'AutoCommit' => 1})
              or die "Can't connect to mysql: $!";
    $dbh->{'mysql_auto_reconnect'} = 1;
    return $dbh;
}

sub parse_json {
    my $str = shift;
    return unless $str;
    
    my $data;
    eval { $data = $coder->decode ($str); };
    return if $@;
    return $data;
}

sub init_traders {
    h_load_trader_details();
}

sub init_objects_id {
    h_load_objects_id();
}

sub init_objects {
    h_stream_objects();
}

sub init_default_player {
    my $file = CACHE_DIR.'players/default.sqf';
    open  (OUT, ">$file") or die "Can't open '$file'";
    print OUT '["PASS",false,"1",[],'.INVENTORY.','.BACKPACK.',[0,0,0],'.MODEL.',0.96]';
    close (OUT);
}

sub init_default_character {
    my $file = CACHE_DIR.'players/default-char.sqf';
    open  (OUT, ">$file") or die "Can't open '$file'";
    print OUT '["PASS",[],[0,0,0,0],[],[],2500,"1"]';
    close (OUT);
}

sub update_players_cache {
    my $sql = 'SELECT PlayerUID FROM Player_DATA';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ();
    return unless $res;
    
    my $PLAYERS_DIR = CACHE_DIR.'players/'.$myPlayerCounter;
    mkdir ($PLAYERS_DIR) unless (-d $PLAYERS_DIR);
    
    my @uids = ();
    while (my ($playerId) = $sth->fetchrow_array) {
        next unless $playerId;
        my $file = $PLAYERS_DIR.'/'.$playerId.'.sqf';
        next if (-f $file);
    
        push @uids, $playerId;
    }
    $sth->finish;
    return unless @uids;
    
    for my $playerId (@uids) {
        update_player_cache ($playerId);
    }
}

sub get_playerId_by_characterId {
    my $characterId = shift;
    return unless $characterId;
    
    my $sql = 'SELECT PlayerUID FROM Character_DATA WHERE CharacterID=?';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($characterId);
    return unless $res;
    
    my ($playerId) = $sth->fetchrow_array;
    $sth->finish;
    
    return $playerId;
}

sub update_player_cache {
    my $playerId = shift;
    return unless $playerId;

    my $sql = "SELECT CharacterID, Worldspace, Inventory, Backpack,
               TIMESTAMPDIFF(MINUTE, Datestamp, LastLogin) as SurvivalTime,
               TIMESTAMPDIFF(MINUTE, LastAte, NOW()) as MinsLastAte,
               TIMESTAMPDIFF(MINUTE, LastDrank, NOW()) as MinsLastDrank,
               Model, Humanity, KillsZ, HeadshotsZ, KillsH, KillsB, CurrentState, Medical 
               FROM Character_DATA
               WHERE PlayerUID=? AND Alive = 1 ORDER BY CharacterID DESC LIMIT 1";
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($playerId);
    #return unless $res;
    
    my ($characterId, $worldSpace, $inventory, $backpack, $survivalTime, $minsLastAte, $minsLastDrank, $model,
        $humanity, $killsZ, $headshotsZ, $killsH, $killsB, $currentState, $medical) = $sth->fetchrow_array;
    $sth->finish;
    return unless (defined $characterId);
    
    my $survival = '[0,0,0]';
    $survival    = '['.$survivalTime.','.$minsLastAte.','.$minsLastDrank.']' if (defined $survivalTime &&
                                                                                 defined $minsLastAte  &&
                                                                                 defined $minsLastDrank);
    my $PLAYERS_DIR = CACHE_DIR.'players/'.$myPlayerCounter;
    mkdir ($PLAYERS_DIR) unless (-d $PLAYERS_DIR);
                                                                                 
    my $file = $PLAYERS_DIR.'/'.$playerId.'.sqf';
    open  (OUT, ">$file") or print STDERR $!;
    print OUT '["PASS",false,"'.$characterId.'",'.$worldSpace.','.$inventory.','.$backpack.','.$survival.','.$model.',0.96]';
    close (OUT);
        
    my $stats = '[0,0,0,0]';
    $stats    = '['.$killsZ.','.$headshotsZ.','.$killsH.','.$killsB.']' if (defined $killsZ && defined $headshotsZ && defined $killsH && defined $killsB);
    
    $file = $PLAYERS_DIR.'/'.$playerId.'-char.sqf';
    open  (OUT, ">$file") or print STDERR $!;
    print OUT '["PASS",'.$medical.','.$stats.','.$currentState.','.$worldSpace.','.$humanity.',"'.$characterId.'"]';
    close (OUT);
    
    return $characterId;
}

sub init_login_uid {
    my $dump = shift;
    return unless $dump;
        
    return unless ($dump =~ m/\sconnected/);
    return if ($dump =~ m/BattlEye Server: Player/);
    
    my ($p, $str)   = split (/Player\s/, $dump);
    return unless (defined $str);
    
    my ($name, $uid) = split (/\sconnected\s/, $str);
    return unless ($name && $uid);
    
    if ($uid =~ m/(\d+)/) {
        $uid = $1;
    } 
    return unless $uid;
    print STDERR "$uid => $name\n";
    
    #my $PLAYERS_DIR = CACHE_DIR.'players/'.$myPlayerCounter;
    #my $file        = $PLAYERS_DIR.'/'.$uid.'.sqf';
    #return if (-e $file);
    
    h_load_player ([101, $uid, INSTANCE, $name]);
}

# 11
sub h_player_counter {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $counter) = @$p;
    return unless ($counter && int($counter) > 0);
    $counter = int($counter);
    
    my $old = CACHE_DIR.'players/'.$myPlayerCounter;
    my $new = CACHE_DIR.'players/'.$counter;
    if (-d $old) {
        rename ($old, $new);
    } else {
        print STDERR "Error h_player_counter($counter): old '$myPlayerCounter' not found!\n";
        mkdir ($new) or print STDERR $!,"\n";
    }
    
    $myPlayerCounter = $counter;
}

# 101
sub h_load_player {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $playerId, $serverId, $playerName) = @$p;
    unless ($playerId && $serverId) {
        print STDERR "Error h_load_player(): playerId or serverId undefined!\n";
        return;
    }
    $playerId =~ s/"//g;
    
    my $PLAYERS_DIR = CACHE_DIR.'players/'.$myPlayerCounter;
    mkdir ($PLAYERS_DIR) unless (-d $PLAYERS_DIR);
    
    my $sql = 'SELECT PlayerName, PlayerSex FROM Player_DATA WHERE PlayerUID=?';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($playerId);
    
    my ($name, $sex) = $sth->fetchrow_array;
    $sth->finish;
    
    my $newPlayer = 0;
    if (defined $name) {
        if ($playerName && $playerName ne $name) {
            $sql = 'UPDATE Player_DATA SET PlayerName=? WHERE PlayerUID=?';
            $sth = $dbh->prepare ($sql);
            $res = $sth->execute ($playerName, $playerId);
            print STDERR "Changed name of player $playerId from '$name' to '$playerName'\n";
        }
    } else {
        $newPlayer  = 1;
        $playerName = 'Unknown' unless $playerName;
        
        $sql = 'INSERT INTO Player_DATA(PlayerUID, PlayerName) VALUES (?, ?)';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($playerId, $playerName);
        print STDERR "Created a new player $playerId named '$playerName'\n";
    }
    
    $sql = "SELECT CharacterID, Worldspace, Inventory, Backpack, 
            TIMESTAMPDIFF(MINUTE, Datestamp, LastLogin) as SurvivalTime,
            TIMESTAMPDIFF(MINUTE, LastAte, NOW()) as MinsLastAte, 
            TIMESTAMPDIFF(MINUTE, LastDrank, NOW()) as MinsLastDrank,
            Model, Medical, Humanity, KillsZ, HeadshotsZ, KillsH, KillsB, CurrentState  
            FROM  Character_DATA 
            WHERE PlayerUID=? AND Alive = 1 ORDER BY CharacterID DESC LIMIT 1";
    $sth = $dbh->prepare ($sql);
    $res = $sth->execute ($playerId);
    
    my ($characterId, $worldSpace, $inventory, $backpack, $survivalTime, $minsLastAte, $minsLastDrank, 
        $model, $medical, $humanity, $killsZ, $headshotsZ, $killsH, $killsB, $currentState) = $sth->fetchrow_array;
    $sth->finish;
    
    $currentState = '[]'      unless (defined $currentState);
    $humanity     = 2500      unless (defined $humanity);
    $medical      = '[]'      unless (defined $medical);
    $worldSpace   = '[]'      unless (defined $worldSpace);
    $inventory    = INVENTORY unless (defined $inventory);  # '[]'
    $backpack     = BACKPACK  unless (defined $backpack);   # '[]'
    $model        = MODEL     unless (defined $model);      # ''
    
    my $survival = '[0,0,0]';
    $survival    = '['.$survivalTime.','.$minsLastAte.','.$minsLastDrank.']' if (defined $survivalTime && 
                                                                                 defined $minsLastAte  && 
                                                                                 defined $minsLastDrank);
    my $newChar = 0;
    if (defined $characterId) {
        $sql = 'UPDATE Character_DATA SET LastLogin = CURRENT_TIMESTAMP WHERE CharacterID=?';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($characterId);
        
        my $stats = '[0,0,0,0]';
        $stats    = '['.$killsZ.','.$headshotsZ.','.$killsH.','.$killsB.']' if (defined $killsZ && defined $headshotsZ &&
                                                                                defined $killsH && defined $killsB);        
        my $file = $PLAYERS_DIR.'/'.$playerId.'-char.sqf';
        open  (OUT, ">$file");
        print OUT '["PASS",'.$medical.','.$stats.','.$currentState.','.$worldSpace.','.$humanity.',"'.$characterId.'"]';
        close (OUT); 
    } else {
        $newChar = 1;
        
        $sql = "SELECT Generation, Humanity, Model FROM Character_DATA 
                WHERE PlayerUID=? AND Alive = 0 ORDER BY CharacterID DESC LIMIT 1";
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($playerId);
        
        my ($generation, $humanity, $cmodel) = $sth->fetchrow_array;
        $sth->finish;
        
        if (defined $generation) {
            $generation++;
        } else {
            $generation = 1;
        }
        
        $humanity = 2500    unless (defined $humanity);
        $model    = $cmodel if (defined $cmodel); 
        
        $sql = "INSERT INTO Character_DATA(PlayerUID, InstanceID, Worldspace, Inventory, Backpack, Medical,
                                           Generation, Datestamp, LastLogin, LastAte, LastDrank, Humanity) 
                VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ?)";
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($playerId, $serverId, $worldSpace, $inventory, $backpack, $medical, $generation, $humanity);
        
        $sql = 'SELECT CharacterID FROM Character_DATA WHERE PlayerUID=? AND Alive = 1 ORDER BY CharacterID DESC LIMIT 1';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($playerId);
        
        ($characterId) = $sth->fetchrow_array;
        $sth->finish;
        
        $playerName = 'Unknown' unless $playerName;
        
        if (defined $characterId) {
            print STDERR "Created a new character $characterId for player '$playerName' ($playerId)\n";
            my $file = $PLAYERS_DIR.'/'.$playerId.'-char.sqf';
            open  (OUT, ">$file");
            print OUT '["PASS",'.$medical.',[0,0,0,0],[],'.$worldSpace.','.$humanity.',"'.$characterId.'"]';
            close (OUT);
        } else {
            print STDERR "Can't found new character for player '$playerName' ($playerId)\n";
        }
    }
    
    my $file = $PLAYERS_DIR.'/'.$playerId.'.sqf';
    open  (OUT, ">$file");
    print OUT '["PASS",false,"'.$characterId.'",'.$worldSpace.','.$inventory.','.$backpack.','.$survival.','.$model.',0.96]';
    close (OUT);
    
    print STDERR "Save player: $file\n";
    
    return $res;
}

# 102
sub h_load_character {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $characterId, $playerId) = @$p;
    unless ($characterId) {
        print STDERR "Error h_load_character(): characterId undefined!\n";
        return;
    }
    $characterId =~ s/"//g;
    $playerId    =~ s/"//g;
    
    if ($characterId == 1 && $playerId) {
        my $sql = 'SELECT CharacterID FROM Character_DATA WHERE PlayerUID=? AND Alive = 1 ORDER BY CharacterID DESC LIMIT 1';
        my $sth = $dbh->prepare ($sql);
        my $res = $sth->execute ($playerId);
        return unless $res;
        
        ($characterId) = $sth->fetchrow_array;
        $sth->finish;
    }
    unless ($characterId) {
        print STDERR "Error h_load_character(): characterId undefined!\n";
        return;
    }
    
    my $sql = "SELECT Worldspace, Medical, Generation, KillsZ, HeadshotsZ, KillsH, KillsB, CurrentState, Humanity, PlayerUID 
               FROM Character_DATA WHERE CharacterID=?";
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($characterId);
    
    my ($worldSpace, $medical, $generation, $killsZ, $headshotsZ, $killsH, $killsB, $currentState, $humanity, $playerUID) = $sth->fetchrow_array;
    $sth->finish;
    return unless (defined $worldSpace);
    
    $playerId = $playerUID if (defined $playerUID);
    
    $worldSpace   ||= '[]';
    $medical      ||= '[]';
    $generation   ||= 1;
    $currentState ||= '[]';
    $humanity       = 2500 unless (defined $humanity);
    
    my $stats = '[0,0,0,0]';
    $stats    = '['.$killsZ.','.$headshotsZ.','.$killsH.','.$killsB.']' if (defined $killsZ && defined $headshotsZ && 
                                                                            defined $killsH && defined $killsB);
    
    my $file = CACHE_DIR.'players/'.$myPlayerCounter.'/'.$playerId.'-char.sqf';
    open  (OUT, ">$file");
    print OUT '["PASS",'.$medical.','.$stats.','.$currentState.','.$worldSpace.','.$humanity.',"'.$characterId.'"]';
    close (OUT);
    
    print STDERR "Save character: $file\n";
    
    return $res;
}

# 103
sub h_log_login {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $playerId, $characterId, $action) = @$p;
    unless ($playerId) {
        print STDERR "Error h_log_login(): playerId undefined!\n";
        return;
    }
    $playerId    =~ s/"//g;
    $characterId =~ s/"//g;
    
    my $sql = 'INSERT INTO Player_LOGIN(PlayerUID, CharacterID, Datestamp, Action) VALUES (?, ?, CURRENT_TIMESTAMP, ?)';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($playerId, $characterId, $action);
    return $res;
}

# 201
sub h_player_update {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $characterId, $worldSpace, $inventory, $backpack, $medical, $justAte, $justDrank, 
        $killsZ, $headshotsZ, $distanceWalked, $durationLived, $currentState, $killsH, $killsB, $model,
        $humanity) = @$p;
    unless ($characterId) {
        print STDERR "Error h_player_update(): characterId undefined!\n";
        return;
    }
    $characterId =~ s/"//g;
    
    if ($worldSpace) {
        my $ws = parse_json ($worldSpace);
        unless ($ws) {
            print STDERR "Error h_player_update(): worldSpace invalid json!\n";
            return;
        }
        if (@$ws) {
            if ($ws->[1] && ref($ws->[1]) eq 'ARRAY') {
                my ($x, $y) = @{$ws->[1]};
                if ($x && $x < -18000) {
                    print STDERR "Error h_player_update(): worldSpace invalid!\n";
                    return;
                }
            }
        }
    }
    if ($inventory) {
        unless ( parse_json ($inventory) ) {
            print STDERR "Error h_player_update(): inventory invalid json!\n";
            $inventory = undef;
        }
    }
    if ($backpack) {
        unless ( parse_json ($backpack) ) {
            print STDERR "Error h_player_update(): backpack invalid json!\n";
            $backpack = undef;
        }
    }
    if ($medical) {
        unless ( parse_json ($medical) ) {
            print STDERR "Error h_player_update(): medical invalid json!\n";
            $medical = undef;
        }
    }
    if ($currentState) {
        unless ( parse_json ($currentState) ) {
            print STDERR "Error h_player_update(): currentState invalid json!\n";
            $currentState = undef;
        }
    }
    if ($model) {
        unless ( parse_json ($model) ) {
            print STDERR "Error h_player_update(): model invalid json!\n";
            $model = undef;
        }
    }
    
    my $str = '';
    $str .= 'Worldspace='.$dbh->quote($worldSpace).','            if ($worldSpace && $worldSpace ne '[]');
    $str .= 'Inventory='.$dbh->quote($inventory).','              if ($inventory  && $inventory  ne INVENTORY && $inventory ne '[]');
    $str .= 'Backpack='.$dbh->quote($backpack).','                if ($backpack   && $backpack   ne BACKPACK && $backpack ne '[]');
    $str .= 'Medical='.$dbh->quote($medical).','                  if ($medical    && $medical    ne '[]');
    $str .= 'CurrentState='.$dbh->quote($currentState).','        if ($currentState && $currentState ne '[]');
    $str .= 'Model='.$dbh->quote($model).','                      if ($model && $model ne MODEL);
    
    $str .= 'LastAte=CURRENT_TIMESTAMP,'                          if ($justAte   && $justAte   eq 'true');
    $str .= 'LastDrank=CURRENT_TIMESTAMP,'                        if ($justDrank && $justDrank eq 'true');
    
    $str .= 'KillsZ=KillsZ+'.int($killsZ).','                     if ($killsZ     && $killsZ > 0);
    $str .= 'HeadshotsZ=HeadshotsZ+'.int($headshotsZ).','         if ($headshotsZ && $headshotsZ > 0);
    $str .= 'DistanceFoot=DistanceFoot+'.int($distanceWalked).',' if ($distanceWalked && $distanceWalked > 0);
    $str .= 'KillsH=KillsH+'.int($killsH).','                     if ($killsH     && $killsH > 0);
    $str .= 'KillsB=KillsB+'.int($killsB).','                     if ($killsB     && $killsB > 0);
    
    if ($humanity) {    
        if ($humanity < 0) {
            $str .= 'Humanity=Humanity-'.int(-1*$humanity).',';
        } else {
            $str .= 'Humanity=Humanity+'.int($humanity).',';
        }
    }
     
    return unless $str;
    
    $str .= 'Duration=Duration+'.int($durationLived || 0);
    
    my $sql = 'UPDATE Character_DATA SET ';
    $sql   .= $str;
    $sql   .= ' WHERE CharacterID=?';
    
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($characterId);
    return $res;
}

# 202
sub h_player_death {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $characterId, $duration) = @$p;
    unless ($characterId) {
        print STDERR "Error h_player_death(): characterId undefined!\n";
        return;
    }
    $characterId =~ s/"//g;
    
    my $sql =  "UPDATE Character_DATA SET Alive = 0, LastLogin = DATE_SUB(CURRENT_TIMESTAMP, INTERVAL ? MINUTE) 
                WHERE CharacterID=? AND Alive = 1";
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute (int($duration), $characterId);
    return unless $res;    
    
    # Reset profile
    my $playerId = get_playerId_by_characterId ($characterId);
    if ($playerId) {    
        h_load_player ([101, $playerId, INSTANCE]);
    } else {
        print STDERR "Error h_player_death('$characterId'): playerId not found!\n";
    }
}

# 203
sub h_player_init {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $characterId, $inventory, $backpack) = @$p;
    unless ($characterId) {
        print STDERR "Error h_player_init(): characterId undefined!\n";
        return;
    }
    $characterId =~ s/"//g;
    
    #my $sql = 'UPDATE Character_DATA SET Inventory=?, Backpack=? WHERE CharacterID=?';
    #my $sth = $dbh->prepare ($sql);
    #my $res = $sth->execute ($inventory, $backpack, $characterId);
    #return $res;
}

# 204
sub h_player_disconnect {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $playerId) = @$p;
    $playerId =~ s/"//g;
    
    update_player_cache ($playerId);
}

# 302
sub h_stream_objects {
    # Clean
    $dbh->do ('DELETE FROM Object_DATA WHERE ClassName="TentStorage" AND (Inventory="[[[],[]],[[],[]],[[],[]]]" OR Damage=1)');
    $dbh->do ('DELETE FROM Object_DATA where Damage > 0.9 AND ObjectID > 89');
    
    my $serverId = INSTANCE;
    my $sql      = "SELECT ObjectID, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Damage 
                    FROM Object_init_DATA WHERE Instance=? AND Classname IS NOT NULL ORDER BY ObjectID";
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($serverId);
    return unless $res;
    
    my %init = ();
    while (my ($objId, $ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage) = $sth->fetchrow_array) {
        next unless $objId;

        $ownerId    ||= 0;
        $worldSpace ||= '[]';
        $inventory  ||= '[]';
        $hitpoints  ||= '[]';
        $fuel       ||= 0;
        $damage     ||= 0;
    
        $init{$objId} = [$ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage];
    }
    $sth->finish;
    
    $sql = "SELECT ObjectID, Classname, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Damage
            FROM Object_DATA WHERE Instance=? AND Classname IS NOT NULL ORDER BY ObjectID";
    $sth = $dbh->prepare ($sql);
    $res = $sth->execute ($serverId);
    return unless $res;
    
    my $chunk = 0;
    my $str   = '';
    my @updates = ();
    while (my ($objId, $className, $ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage) = $sth->fetchrow_array) {
        if ( $objId && $damage && $damage > 0.7 && $init{$objId} ) {
            print STDERR "Respawn '$className' ($objId)\n";
            ($ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage) = @{$init{$objId}};
            push @updates, $objId;
        }
        
        $ownerId    ||= 0;
        $worldSpace ||= '[]';
        $inventory  ||= '[]';
        $hitpoints  ||= '[]';
        $fuel       ||= 0;
        $damage     ||= 0;
        
        $fuel   = sprintf ("%.3f", $fuel);
        $damage = sprintf ("%.3f", $damage);
        
        my $obj = '["OBJ","'.$objId.'","'.$className.'","'.$ownerId.'",'.$worldSpace.','.$inventory.','.$hitpoints.','.$fuel.','.$damage.']';
        
        if (length($obj) > 1300) {
            print STDERR "SKIP OBJ: $objId\n";
            next;
        }
        
        if (length($str) + length($obj) > 1500) {
            my $file = CACHE_DIR.'objects'.($chunk || '').'.sqf';
            open  (OUT, ">$file");
            print OUT '['.$str.']';
            close (OUT);
            $str = '';
            $chunk++;
        }
        
        $str .= ',' if $str;
        $str .= $obj;
    }
    $sth->finish;
    
    for my $objId (@updates) {
        my ($ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage) = @{$init{$objId}};
        $sql = 'UPDATE Object_DATA SET CharacterID=?, Worldspace=?, Inventory=?, Hitpoints=?, Fuel=?, Damage=? WHERE Instance=? AND ObjectID=?';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($ownerId, $worldSpace, $inventory, $hitpoints, $fuel, $damage, $serverId, $objId);
    }
    
    return unless $str;  
    
    my $file = CACHE_DIR.'objects'.($chunk || '').'.sqf';
    open  (OUT, ">$file");
    print OUT '['.$str.']';
    close (OUT);
    
    $file = CACHE_DIR.'object_chunks.sqf';
    open  (OUT, ">$file");
    print OUT $chunk;
    close (OUT);
}

# 303
sub h_object_update_inventory {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectId, $inventory) = @$p;
    unless ($objectId && $inventory) {
        print STDERR "Error h_object_update_inventory(): objectId or inventory undefined!\n";
        return;
    }
    $objectId =~ s/"//g;
    
    unless ( parse_json ($inventory) ) {
        print STDERR "Error h_object_update_inventory($objectId): inventory invalid json!\n";
        return;
    }
    
    my $serverId = INSTANCE;
    my $sql      = 'UPDATE Object_DATA SET Inventory=? WHERE ObjectID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($inventory, $objectId, $serverId);
    return $res;
}

# 304
sub h_object_delete {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectId) = @$p;
    unless ($objectId) {
        print STDERR "Error h_object_delete(): objectId undefined!\n";
        return;
    }
    $objectId =~ s/"//g;
    
    my $serverId = 1;
    my $sql      = 'DELETE FROM Object_DATA WHERE ObjectID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($objectId, $serverId);
    
    if ($res) {
        $sql = 'DELETE FROM Object_init_DATA WHERE ObjectID=? AND Instance=?';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($objectId, $serverId);
    }
    
    return $res;
}

# 305
sub h_vehicle_moved {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectId, $worldSpace, $fuel) = @$p;
    unless ($objectId && $worldSpace) {
        print STDERR "Error h_vehicle_moved(): objectId undefined!\n";
        return;
    }
    $objectId =~ s/"//g;
    
    unless ( parse_json ($worldSpace) ) {
        print STDERR "Error h_vehicle_moved($objectId): worldSpace invalid json!\n";
        return;
    }
    
    my $serverId = INSTANCE;
    my $sql      = 'UPDATE Object_DATA SET Worldspace=?, Fuel=? WHERE ObjectID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($worldSpace, $fuel, $objectId, $serverId);
    return $res;
}

# 306
sub h_vehicle_damaged {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectId, $hitPoints, $damage) = @$p;
    unless ($objectId && defined $hitPoints && defined $damage) {
        print STDERR "Error h_vehicle_damaged(): objectId undefined!\n";
        return;
    }
    $objectId =~ s/"//g;
    
    if ($hitPoints) {
        unless ( parse_json ($hitPoints) ) {
            print STDERR "Error h_vehicle_damaged($objectId): hitPoints invalid json!\n";
            return;
        }
    }
    
    $hitPoints ||= '[]';
    $damage    ||= 0;
    
    my $serverId = INSTANCE;
    my $sql      = 'UPDATE Object_DATA SET Hitpoints=?, Damage=? WHERE ObjectID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($hitPoints, $damage, $objectId, $serverId);
    return $res;
}

# 307
sub h_get_date_time {}

# 308
sub h_object_publish {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $serverId, $className, $damage, $characterId, $worldSpace, $inventory, $hitPoints, $fuel, $objectUID) = @$p;
    unless ($className) {
        print STDERR "Error h_object_publish(): className undefined!\n";
        return;
    }
    $characterId =~ s/"//g;
    $objectUID   =~ s/"//g;
    
    if ($worldSpace) {
        unless ( parse_json ($worldSpace) ) {
            print STDERR "Error h_object_publish($className): worldSpace invalid json!\n";
            return;
        }
    }
    if ($inventory) {
        unless ( parse_json ($inventory) ) {
            print STDERR "Error h_object_publish($className): inventory invalid json!\n";
            $inventory = '[]';
        }
    }
    if ($hitPoints) {
        unless ( parse_json ($hitPoints) ) {
            print STDERR "Error h_object_publish($className): hitPoints invalid json!\n";
            $hitPoints = '[]';
        }
    }
    
    $serverId   ||= INSTANCE;
    $worldSpace ||= '[]';
    $inventory  ||= '[]';
    $hitPoints  ||= '[]';
    $damage     ||= 0;
    $fuel       ||= 0;
    
    my $sql = "INSERT INTO Object_DATA(ObjectUID, Instance, Classname, Damage, CharacterID, Worldspace, Inventory, 
                                       Hitpoints, Fuel, Datestamp) 
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($objectUID, $serverId, $className, $damage, $characterId, $worldSpace, $inventory, $hitPoints, $fuel);
    
    # Cache object ID
    $sql = 'SELECT ObjectID FROM Object_DATA WHERE ObjectUID=?';
    $sth = $dbh->prepare ($sql);
    $res = $sth->execute ($objectUID);
    return unless $res;
                
    my ($objectId) = $sth->fetchrow_array;
    $sth->finish;
    return unless (defined $objectId);

    my $file = CACHE_DIR.'objects/'.$objectUID.'.sqf';
    open  (OUT, ">$file");
    print OUT '["PASS","'.$objectId.'"]';
    close (OUT);
}

# 309
sub h_object_uid_update_inventory {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectUID, $inventory) = @$p;
    unless ($objectUID && $inventory) {
        print STDERR "Error h_object_uid_update_inventory(): objectUID or inventory undefined!\n";
        return;
    }
    $objectUID =~ s/"//g;
    
    unless ( parse_json ($inventory) ) {
        print STDERR "Error h_object_uid_update_inventory($objectUID): inventory invalid json!\n";
        return;
    }
    
    my $serverId = INSTANCE;
    my $sql      = 'UPDATE Object_DATA SET Inventory=? WHERE ObjectUID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($inventory, $objectUID, $serverId);
    return $res;
}

# 310
sub h_object_uid_delete {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $objectUID) = @$p;
    unless ($objectUID) {
        print STDERR "Error h_object_uid_delete(): objectUID undefined!\n";
        return;
    }
    $objectUID =~ s/"//g;
    
    my $serverId = INSTANCE;
    my $sql      = 'DELETE FROM Object_DATA WHERE ObjectUID=? AND Instance=?';
    my $sth      = $dbh->prepare ($sql);
    my $res      = $sth->execute ($objectUID, $serverId);
    
    if ($res) {
        $sql = 'DELETE FROM Object_init_DATA WHERE ObjectUID=? AND Instance=?';
        $sth = $dbh->prepare ($sql);
        $res = $sth->execute ($objectUID, $serverId);
    }
    
    return $res;
}

# 388 - loadObjectID
sub h_load_objects_id {
    my $sql = 'SELECT ObjectID, ObjectUID FROM Object_DATA ORDER BY ObjectUID';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ();
    #return unless $res;
    
    while (my ($objectId, $objectUID) = $sth->fetchrow_array) {
        next unless (defined $objectId);
        
        my $file = CACHE_DIR.'objects/'.$objectUID.'.sqf';
        open  (OUT, ">$file");
        print OUT '["PASS","'.$objectId.'"]';
        close (OUT);
    }
    $sth->finish;
}

# 398 - tradeObject 
sub h_trade_object {
    my $p = shift;
    return unless ($p && ref($p) eq 'ARRAY');
    my ($cmd, $traderObjectId, $action) = @$p;
    return unless ($traderObjectId && defined $action);
    
    my $sql;
    if ($action == 0) {
        $sql = 'UPDATE Traders_DATA SET qty = qty - 1 WHERE id=? AND qty > 0';
    } else {
        $sql = 'UPDATE Traders_DATA SET qty = qty + 1 WHERE id=?';
    }
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ($traderObjectId);    
    return $res;
}

# 399 - loadTraderDetails
sub h_load_trader_details {
    my $sql = 'SELECT id, item, qty, buy, sell, `order`, tid, afile FROM Traders_DATA';
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ();
    return unless $res;
    
    my %tids = ();
    my $charecterId = 0;
    while (my ($id, $item, $qty, $buy, $sell, $order, $tid, $afile) = $sth->fetchrow_array) {
        next unless $tid;
        $tids{$tid} = [] unless $tids{$tid};
        
        push @{$tids{$tid}}, '['.$id.','.$item.','.$qty.','.$buy.','.$sell.','.$order.','.$tid.',"'.$afile.'"]';
    }     
    $sth->finish;
    
    return unless %tids;
    
    while (my ($tid, $v) = each %tids) {
        next unless ($v && @$v);
        my $str = join (',', @$v);
    
        my $file = CACHE_DIR.'traders/'.$tid.'.sqf';
        open  (OUT, ">$file");
        print OUT '['.$str.']';
        close (OUT);
    }
    
    undef %tids;
}


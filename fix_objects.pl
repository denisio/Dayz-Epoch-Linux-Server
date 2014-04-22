#!/usr/bin/perl
#
# Copyright 2014 by Denis Erygin,
# denis.erygin@gmail.com
#

use DBI;
use JSON::XS;
use warnings;
use strict;

use constant DB_NAME   => 'epoch';
use constant DB_LOGIN  => 'dayz';
use constant DB_PASSWD => 'dayz';

my $coder = JSON::XS->new->ascii(1)->shrink(1)->allow_nonref(1)->max_depth(5)->max_size(1048576);

my $dbh = connect_to_db ();
unless ($dbh) {
    print "Error: Can't connect to mysql db!\n";
    exit;
}

parse();

$dbh->disconnect();

#---------------------------------------------------
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
    print $@,"\n" if $@;
    return if $@;
    
    return $data;
}

sub parse {
    my $sql = 'SELECT ObjectID, Classname, Worldspace, Inventory, Hitpoints FROM Object_DATA';    
    my $sth = $dbh->prepare ($sql);
    my $res = $sth->execute ();
    return unless $res;
    
    my $c = 0;
    my %oids = ();
    while (my ($oid, $name, $worldSpace, $inventory, $hitpoints) = $sth->fetchrow_array) {
        if ($worldSpace) {
            unless ( parse_json($worldSpace) ) {
                print STDERR "[$oid, $name](worldSpace): $worldSpace\n";
                $oids{$oid} = 'Worldspace';
                next;
            }
        }
        if ($inventory) {
            unless ( parse_json($inventory) ) {
                print STDERR "[$oid, $name](inventory): $inventory\n";
                $oids{$oid} = 'Inventory';
                next;
            }
        }
        if ($hitpoints) {
            unless ( parse_json($hitpoints) ) {
                print STDERR "[$oid, $name](hitpoints): $hitpoints\n";
                $oids{$oid} = 'Hitpoints';
                next;
            }
        }
        $c++;
    }
    $sth->finish;
    
    print STDERR "Total: $c, Corrupted: ".scalar(keys %oids)."\n";
    return unless %oids;
        
    while (my ($oid, $field) = each %oids) {
        $dbh->do ('UPDATE Object_DATA SET '.$field.'=\'[]\' WHERE ObjectID='.$oid);
    }
}


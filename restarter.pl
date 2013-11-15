#!/usr/bin/perl
#
# Copyright 2013 by Denis Erygin,
# denis.erygin@gmail.com
#

use warnings;
use strict;

use constant PATH      => $ENV{'PWD'}.'/'; # Set your dayz server dir
use constant PIDFILE   => PATH.'2302.pid';
use constant CACHE_DIR => PATH.'cache/players';

unless (-f PATH.'epoch') {
    print STDERR "Can't found server binary!\n";
    exit;
}

set_time  ();
logrotate ();

if (-f PIDFILE) {
    open  (IN, '<'.PIDFILE) or die "Can't open: $!";
    my $pid = int(<IN>);
    close (IN);

    my $res = `kill -TERM $pid 2>&1`;
    print STDERR $res,"\n" if $res;
   
    unlink (PIDFILE) if (-f PIDFILE);    
    clean_cache();
}

print STDERR "Restart Dayz Epoch server...\n";
chdir (PATH);

my $cmd = '/usr/bin/screen -h 20000 -fa -d -m -S epoch '.PATH.'epoch.sh';
my $res = `$cmd`;
print STDERR $res,"\n" if $res;
exit;

#-----------------------------------------------------------------------------------------------
sub set_time {
    my ($s, $m, $h, $day, $mon, $y) = localtime(time() - 3*3600);
    $y += 1900;
    $mon++;
    
    ($h, $m) = (20, 0) if ($h > 20 || ($h >= 0 && $h < 4));
    
    my $file = PATH.'cache/set_time.sqf';
    open  (IN, ">$file") or die "Can't find $file";
    #print IN '["PASS",['.$y.','.$mon.','.$day.','.$h.','.$m.']]';
    print IN '["PASS",[2012,6,6,'.$h.','.$m.']]';
    close (IN);
}

sub logrotate {
    my $log = PATH.'dump.log';
    if (-f $log) {
        my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size) = stat($log);
    
        if ($size && $size >= 100000000) {
            print STDERR "logrotate $size\n";
        
            my $nlog = $log.'.'.time();
            my $res  = `cp $log $nlog 2>&1`;
            print STDERR $res,"\n" if $res;
        
            $res = `echo '' > $log 2>&1`;
            print STDERR $res,"\n" if $res;
        }
    }
}

sub clean_cache {
    return unless (-d CACHE_DIR);
    opendir (DIR, CACHE_DIR) or die $!;

    while (my $file = readdir (DIR)) {
        next unless ($file =~ m/^\d+$/);
        my $dir = CACHE_DIR.'/'.$file;
        next unless (-d $dir);
        
        my $res = `rm -rf $dir 2>&1`;
        print STDERR $res,"\n" if $res;
    }

    closedir (DIR);
}


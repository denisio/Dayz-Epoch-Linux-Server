Dayz-Epoch-Linux-Server (Steam)
===============================

A private hive DayZ Epoch 1.0.5.1 server on Linux (Steam)

Installation instructions
=========================

1. The following programs must be installed on your Linux system: screen, gcc, perl, mysql.
   # apt-get install perl screen mysql-server mysql-client

2. Download and unpack steamcmd (http://media.steampowered.com/installer/steamcmd_linux.tar.gz)

3. Download ARMA II, ARMA II: OA and the beta packages using steamcmd:
   $ steamcmd/steamcmd.sh +login STEAM_USERNAME STEAM_PASSWORD +force_install_dir /home/user/epoch
   > @sSteamCmdForcePlatformType windows
   > app_update 33900 validate
   > app_update 33910 validate
   > app_update 33930 validate
   > app_update 219540 beta112555 validate
   > quit

   Download and install DayZ Epoch Mod 1.0.5.1 (http://goo.gl/IN1Pt1).

4. Run ./install<br>
   Watch the messages - they might inform you whether your installation
   failed! Double check that all directories were renamed to lower case.
   Remove any .dll files you might still find (in battleye, expansion and
   expansion/battleye directories).<br>
   When adding mission .pbo's or mods remember to run ./tolower again or
   manually change the filenames to lowercase.<br>
   <b>ANY uppercase letter in a filename will crash the server!</b><br>
   <pre>$ for x in *; do mv $x `echo $x | tr [A-Z] [a-z]`; done</pre>

5. Create database "epoch" (login: "dayz", password: "dayz") and load "database.sql" into Mysql.<br>
   Load v1.0.5.1 db update "v1051update.sql" into Mysql.<br>
   <pre>$ mysql -u root -p mysql
   mysql> create database epoch;
   mysql> GRANT ALL PRIVILEGES ON epoch.* TO 'dayz'@'localhost' IDENTIFIED BY 'dayz';
   mysql> use epoch;
   mysql> source database.sql;
   mysql> source v1042update.sql;
   mysql> source v1042a_update.sql;
   mysql> source v1051update.sql;</pre>

6. Install the required packages:<br>
   $ sudo apt-get install libjson-xs-perl<br>
   $ sudo apt-get install libdbd-mysql-perl<br>
   For 64-bit only:<br>
   $ sudo apt-get install lib32stdc++6

7. Run ./epoch.sh for test<br>
   Watch the messages - they might inform you whether your installation failed!

8. Run ./restarter.pl<br>
   $ screen -r<br>
   Press Ctrl+A+D to detach the screen.

Please do not forget that the production server must run by "restarter.pl" !


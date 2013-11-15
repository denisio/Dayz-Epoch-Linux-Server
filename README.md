Dayz-Epoch-Linux-Server
=======================

A private hive DayZ Epoch 1.0.2.5 server on Linux

Installation instructions
=========================

1. The following programs must be installed on your Linux system: screen, tar, gcc, perl, mysql.

2. Download and install newest ArmA beta patch (http://www.arma2.com/beta-patch.php).

3. Copy the whole "ArmA 2: Operation Arrowhead" directory from Windows to server Linux-directory.<br>
   ArmA2 directory should contain subdirectories "Addons", "Dta", "Expansion", etc.<br>
   Example: pack with PKZIP (WinZip, PowerArchiver, etc.) on Windows and unpack with "unzip" on Linux.<br>
   DO NOT use upper case letters in the ArmA2 directory name (or in any files that the server uses 
   like missions or mods):<br>
   GOOD: "/home/bob/arma2arrowhead"<br>
   BAD:  "/home/bob/ArmA2ArrowHead"<br>
   http://rutor.org/torrent/240581/

3. Download and install DayZ Epoch Mod 1.0.2.5 (https://s3.amazonaws.com/dayzepoch/DayZ_Epoch_Client_1.0.2.5_Release_a1.7z?torrent).

4. Run ./install<br>
   Watch the messages - they might inform you whether your installation
   failed. Double check that all directories were renamed to lower case.
   Remove any .dll files you might still find (in battleye, expansion and
   expansion/battleye directories).<br>
   When adding mission .pbo's or mods remember to run ./tolower again or
   manually change the filenames to lowercase.<br> ANY uppercase letter in
   a filename will crash the server!<br>
   <pre>$ for x in *; do mv $x `echo $x | tr [A-Z] [a-z]`; done</pre>

5. Create database "epoch" (login: "dayz", password: "dayz") and load "database.sql" into Mysql.<br>
   $ chmod +x install server *.sh *.pl<br>
   $ sudo apt-get install libjson-xs-perl<br>
   For 64-bit only:<br>
   $ sudo apt-get install lib32stdc++6 

6. Run ./epoch.sh for test<br>
   Watch the messages - they might inform you whether your installation failed.

7. Run ./restarter.pl<br>
   $ screen -r





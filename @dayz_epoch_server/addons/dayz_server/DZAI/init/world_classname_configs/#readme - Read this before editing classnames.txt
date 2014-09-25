Load order of classname config files:
-----------------------------------
1. dzai_config.sqf
2. <mapname>/default.sqf OR <mapname>/dayz_<modname>.sqf OR epoch/dayz_epoch.sqf (if running Epoch)

**IMPORTANT**: If removing classnames, be sure to check dzai_config.sqf for other classnames you want to remove.


Explanation for world_classname_configs directory
-----------------------------------

Config files are organized into different folders on a per-map basis with the exception of DayZ Epoch, which is located in its own "epoch" folder.

Do not edit the <mapname>_classnames.sqf files! They are only used to direct DZAI to the correct config file.

Inside each mapname folder, there is a default.sqf file. This config file is read if other mods for the map aren't detected.

Example: If running vanilla DayZ, /Chernarus/default.sqf will be read. If running DayZ Epoch, /epoch/dayz_epoch.sqf will be read instead.

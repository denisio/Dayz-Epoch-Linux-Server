/*
	Reads from CfgWorlds config and extracts information about city/town names, positions, and types.

	Used to generate waypoint positions for AI vehicle patrols.
*/

private ["_location","_cfgWorldName","_startTime","_trader_markers","_allPlaces"];

_startTime = diag_tickTime;
_allPlaces = [];
_cfgWorldName = configFile >> "CfgWorlds" >> worldName >> "Names";
_trader_markers = [];

if (DZAI_modName == "epoch") then {
	_worldName = (toLower worldName);
	_trader_markers = call {
		if (_worldName == "chernarus") exitWith {["Tradercitystary","wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Klen","BoatDealerEast","TradercityBash","HeroTrader"]};
		if (_worldName == "napf") exitWith {["NeutralTraderCity","FriendlyTraderCity","HeroVendor","UnarmedAirVehicles","West Wholesaler","NorthWholesaler","NorthBoatVendor","BanditVendor","SouthBoatVendor","NeutralTraderCIty2"]};
		if (_worldName == "sauerland") exitWith {["NeutralTraderCity","FriendlyTraderCity","HeroVendor","UnarmedAirVehicles","SouthWholesaler","NorthWholesaler","BanditVendor","NeutralTraderCIty2"]};
		if (_worldName == "tavi") exitWith {["TraderCityLyepestok","TraderCitySabina","TraderCityBilgrad","TraderCityBranibor","BanditVendor","HeroVendor","AircraftDealer","AircraftDealer2","Misc.Vendor","Misc.Vendor2","BoatDealer","BoatDealer2","BoatDealer3","BoatDealer4","Wholesaler","Wholesaler2"]};
		if (_worldName == "namalsk") exitWith {["GerneralPartsSupplies","WholesalerNorth","Doctor","HighEndWeaponsAmmo","HeroVendor","VehicleFriendly","NeutralVendors","WholesalerSouth","LowEndWeaponsAmmo","BoatVendor","Bandit Trader","PlaneVendor"]};
		if (_worldName == "panthera2") exitWith {["AirVehiclesF","WholesalerWest","HeroVehicles","NeutralAirVehicles","Boats","NeutralTraders","NeutralTraderCity2","WholesaleSouth","PlanicaTraders","IslandVehiclePartsVendors"]};
		if (_worldName == "smd_sahrani_a2") exitWith {["Tradercitycorazol","wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Ixel","BoatDealerEast","TradercityBag","HeroTrader"]};
		if (_worldName == "sara") exitWith {["Tradercitycorazol","wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Ixel","BoatDealerEast","TradercityBag","HeroTrader"]};
		if (_worldName == "fdf_isle1_a") exitWith {["wholesaleSouth","boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","Jesco","TradercityBash","HeroTrader"]};
		if (_worldName == "caribou") exitWith {["boatTraderEast","BoatDealerSouth","AirVehicles","BanditDen","NorthNeutralVendors","SouthNeutralVendors","HeroTrader","BlackMarket","SouthWestWholesale"]};
		if (_worldName == "lingor") exitWith {["RaceTrack","RepairGuy","PlaneVendor","Wholesale","HighWeapons/ammo","Parts","Choppers","lowEndCars","LowEndWeapons","HighEndCars","MedicalandBags","Wholesaler","BagsNFood","Wholesalers","DirtTrackVendor","OffRoad4x4","BoatVendor","BoatVendor1","BoatVendor2","BagVendor1","BagVendor2","Doctor2","BanditTrader","HeroTrader"]};
		if (_worldName == "dingor") exitWith {["RaceTrack","RepairGuy","PlaneVendor","Wholesale","HighWeapons/ammo","Parts","Choppers","lowEndCars","LowEndWeapons","HighEndCars","MedicalandBags","Wholesaler","BagsNFood","Wholesalers","DirtTrackVendor","OffRoad4x4","BoatVendor","BoatVendor1","BoatVendor2","BagVendor1","BagVendor2","Doctor2","BanditTrader","HeroTrader"]};
		if (_worldName == "takistan") exitWith {["tradercitykush","Trader_City_Nur","Trader_City_Garm","Wholesaler","Wholesaler_1","Airplane Dealer","BanditTrader","BlackMarketVendor"]};
		if (_worldName == "fapovo") exitWith {["BanditTrader","AirVehicleUnarmed","TraderCity1","TraderCity2","Wholesaler","BanditVendor","HeroVendor","BoatVendor"]};
		if (_worldName == "zargabad") exitWith {["HeroCamp","BanditCamp"]};
		if (_worldName == "isladuala") exitWith {["Trader City Camara","st_3","st_4","st_3_1","st_3_1_1","st_3_1_1_1","st_3_2","st_3_2_1","st_3_2_2","st_3_2_3","st_3_2_3_1"]};
		if (_worldName == "cmr_ovaron") exitWith {["AirVehiclesF","WholesalerWest","HeroVehicles","NeutralAirVehicles","Boats","NeutralTraders","NeutralTraderCity2","WholesaleSouth","PlanicaTraders","IslandVehiclePartsVendors"]};
		if (_worldName == "shapur_baf") exitWith {["Safe Zone","test"]};
		[]
	};
	
	_scanTargets = if (!isNil "serverTraders") then {serverTraders} else {["CAManBase"]};

	for "_i" from 0 to ((count _trader_markers) - 1) do {
		_traderPos = (getMarkerPos (_trader_markers select _i));
		if (((_traderPos select 0) != 0) && {((_traderPos select 1) != 0)}) then {
			if (DZAI_dynAISpawns) then {_blacklist = createLocation ["Strategic",_traderPos,250,250];};
			_nearbyUnits = _traderPos nearEntities [_scanTargets,250];
			{
				if ((local _x) && {!simulationEnabled _x}) then {
					_x setCaptive true;
				};
			} count _nearbyUnits;
		};
		uiSleep 0.01;
	};
};

for "_i" from 0 to ((count _cfgWorldName) -1) do {
	_allPlaces set [(count _allPlaces),configName (_cfgWorldName select _i)];
	//diag_log format ["DEBUG :: Added location %1 to allPlaces array.",configName (_cfgWorldName select _i)];
};

{
	_placeType = getText (_cfgWorldName >> _x >> "type");
	if (_placeType in ["NameCityCapital","NameCity","NameVillage","NameLocal"]) then {
		_placeName = getText (_cfgWorldName >> _x >> "name");
		_placePos = [] + getArray (_cfgWorldName >> _x >> "position");
		_isAllowedPos = ((({(_placePos distance (getMarkerPos _x)) < 300} count _trader_markers) == 0) && {({(_placePos distance (getMarkerPos _x)) < ((getMarkerSize _x) select 0)} count DZAI_waypointBlacklist) == 0});
		if (_placeType != "NameLocal") then {
			_blacklist = createLocation ["Strategic",_placePos,600,600];
			if (_isAllowedPos) then {
				DZAI_locationsLand set [(count DZAI_locationsLand),[_placeName,_placePos,_placeType]];	//Location Name, Position, Type.
			};
		};
		if (_isAllowedPos) then {
			DZAI_locations set [(count DZAI_locations),[_placeName,_placePos,_placeType]];	//Location Name, Position, Type.
		};
	};
	if ((_forEachIndex % 10) == 0) then {uiSleep 0.05};
} forEach _allPlaces;

DZAI_locations_ready = true;

if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Location configuration completed with %1 locations found in %2 seconds.",(count DZAI_locations),(diag_tickTime - _startTime)]};

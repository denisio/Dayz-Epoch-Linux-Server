/*
	Lingor spawn point definitions
	
	Notes: Markers are used to manually-specify exact locations to use as spawn points. Markers are used for spawn points when there are no/not enough buildings within 300m of trigger center to use as spawn positions.
	
	Last updated: 12:19 AM 7/23/2013
*/

//begin markers
_this = createMarker ["Prison1", [3109.2454, 8275.2422, 9.5367432e-007]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_0 = _this;

_this = createMarker ["Prison2", [2941.7852, 7946.2852, 5.7220459e-006]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_1 = _this;

_this = createMarker ["Prison3", [3192.8079, 7932.6636]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_2 = _this;

_this = createMarker ["Prison4", [3231.5239, 8156.4961, -1.9073486e-005]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_3 = _this;

_this = createMarker ["Prison5", [2977.0652, 8197.6357, 3.8146973e-006]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_4 = _this;

_this = createMarker ["Palace1", [6976.9258, 6350.7671, -1.9073486e-006]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_11 = _this;

_this = createMarker ["Palace2", [6922.918, 6467.9102, -3.0517578e-005]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_12 = _this;

_this = createMarker ["Palace3", [6834.2813, 6476.8394, -2.2888184e-005]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_13 = _this;

_this = createMarker ["Sargento1", [4363.5332, 1883.884, 1.9073486e-006]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_22 = _this;

_this = createMarker ["Sargento2", [4429.6279, 1520.834]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_23 = _this;

_this = createMarker ["Sargento3", [4462.6128, 1773.457, 3.8146973e-006]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_24 = _this;

_this = createMarker ["Sargento4", [4427.3809, 1649.6858, -1.335144e-005]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_25 = _this;

_this = createMarker ["Sargento5", [4143.8174, 1846.0819, 1.9073486e-005]];
_this setMarkerType "Empty";
_this setMarkerBrush "Solid";
_marker_26 = _this;

if ((DZAI_modName == "lingorskaro") || (DZAI_modName == "huntinggrounds")) then {
	_this = createMarker ["NMB1_1", [1860.3685, 8914.6328, 0]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_29 = _this;

	_this = createMarker ["NMB1_2", [1766.4445, 8785.083, 6.1035156e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_30 = _this;

	_this = createMarker ["NMB1_3", [2065.157, 8850.5146, -8.5830688e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_31 = _this;

	_this = createMarker ["NMB1_4", [1964.6107, 8930.249, 1.1920929e-006]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_32 = _this;

	_this = createMarker ["NMB1_5", [1790.6433, 8654.4551, 9.5367432e-006]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_33 = _this;

	_this = createMarker ["NMB2_1", [2617.1428, 9395.9561, 4.5776367e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_34 = _this;

	_this = createMarker ["NMB2_2", [2430.6089, 9137.5869, 5.531311e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_35 = _this;

	_this = createMarker ["NMB2_3", [2628.978, 9089.625, -2.9325485e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_36 = _this;

	_this = createMarker ["NMB2_4", [2517.6316, 9014.7051, -0.00032329559]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_37 = _this;

	_this = createMarker ["NMB2_5", [2706.9177, 9278.5254, -4.2915344e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_38 = _this;

	_this = createMarker ["NMB3_1", [779.80127, 7832.2363, -2.9087067e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_39 = _this;

	_this = createMarker ["NMB3_2", [977.49982, 7861.8066, 0.00010538101]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_40 = _this;

	_this = createMarker ["NMB3_3", [1045.5101, 7677.5601, -0.00018167496]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_41 = _this;

	_this = createMarker ["NMB3_4", [848.31274, 7559.3047, 2.1934509e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_42 = _this;

	_this = createMarker ["NMB3_5", [659.41174, 7742.1211, -1.2636185e-005]];
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_marker_43 = _this;
};

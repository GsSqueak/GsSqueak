predefined flaps
newNavigatorFlap
	"Answer a newly-created flap which adheres to the bottom edge of the
	screen and which holds the project navigator controls."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_navBar _gsSqueakTemp_aFlap |
	_gsSqueakTemp_navBar := ProjectNavigationMorph preferredNavigator new.
	_gsSqueakTemp_aFlap := PasteUpMorph newSticky borderWidth: 0;
				 extent: _gsSqueakTemp_navBar extent + (0 @ 20);
				
				color: (Color orange alpha: 0.8);
				 beFlap: true;
				 addMorph: _gsSqueakTemp_navBar beSticky.
	_gsSqueakTemp_aFlap hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap.
	_gsSqueakTemp_aFlap useRoundedCorners.
	_gsSqueakTemp_aFlap setNameTo: 'Navigator Flap' translated.
	_gsSqueakTemp_navBar fullBounds.
	"to establish width"
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aFlap.
	_gsSqueakTemp_aFlapTab
		setName: 'Navigator' translated
		edge: #bottom
		color: Color orange.
	_gsSqueakTemp_aFlapTab position: _gsSqueakTemp_navBar width // 2 - (_gsSqueakTemp_aFlapTab width // 2) @ (self currentWorld height - _gsSqueakTemp_aFlapTab height).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Navigator' translated"
predefined flaps
newObjectsFlap
	"Answer a fully-instantiated flap named 'Objects' to be placed at the
	top of the screen."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_anObjectsTool |
	_gsSqueakTemp_anObjectsTool := ObjectsTool new.
	_gsSqueakTemp_anObjectsTool initializeForFlap.
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_anObjectsTool beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Objects' translated
		edge: #top
		color: Color red lighter.
	_gsSqueakTemp_aFlapTab position: Display width - (_gsSqueakTemp_aFlapTab width + 22) @ 0.
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_anObjectsTool extent: self currentWorld width @ 200.
	_gsSqueakTemp_anObjectsTool beFlap: true.
	_gsSqueakTemp_anObjectsTool color: Color red muchLighter.
	_gsSqueakTemp_anObjectsTool clipSubmorphs: true.
	_gsSqueakTemp_anObjectsTool showCategories.
	^ _gsSqueakTemp_aFlapTab
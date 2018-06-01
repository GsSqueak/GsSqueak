predefined flaps
newStackToolsFlap
	"Add a flap with stack tools in it"
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_aStrip |
	_gsSqueakTemp_aStrip := PartsBin
				newPartsBinWithOrientation: #leftToRight
				andColor: Color red muchLighter
				from: self quadsDefiningStackToolsFlap.
	"alpha: 0.2"
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aStrip beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Stack Tools' translated
		edge: #bottom
		color: Color brown lighter lighter.
	_gsSqueakTemp_aFlapTab position: Display width - (_gsSqueakTemp_aFlapTab width + 226) @ (self currentWorld height - _gsSqueakTemp_aFlapTab height).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_aStrip extent: self currentWorld width @ 78.
	_gsSqueakTemp_aStrip beFlap: true.
	_gsSqueakTemp_aStrip autoLineLayout: true.
	_gsSqueakTemp_aStrip extent: self currentWorld width @ 70.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Stack Tools' translated"
predefined flaps
newWidgetsFlap
	"Answer a newly-created flap which adheres to the bottom edge of the
	screen and which holds prototypes of standard widgets."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_aStrip |
	_gsSqueakTemp_aStrip := PartsBin
				newPartsBinWithOrientation: #leftToRight
				andColor: (Color blue muchLighter alpha: 0.8)
				from: self quadsDefiningWidgetsFlap.
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aStrip beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Widgets' translated
		edge: #bottom
		color: Color blue lighter lighter.
	_gsSqueakTemp_aFlapTab position: Display width - (_gsSqueakTemp_aFlapTab width + 122) @ (self currentWorld height - _gsSqueakTemp_aFlapTab height).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_aStrip extent: self currentWorld width @ 78.
	_gsSqueakTemp_aStrip beFlap: true.
	_gsSqueakTemp_aStrip autoLineLayout: true.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Widgets' translated"
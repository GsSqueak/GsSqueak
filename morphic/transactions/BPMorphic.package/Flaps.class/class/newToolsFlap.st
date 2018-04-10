predefined flaps
newToolsFlap
	"Answer a newly-created flap which adheres to the right edge of the
	screen and which holds prototypes of standard tools."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_aStrip |
	_gsSqueakTemp_aStrip := PartsBin
				newPartsBinWithOrientation: #topToBottom
				andColor: (Color orange muchLighter alpha: 0.8)
				from: self quadsDefiningToolsFlap.
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aStrip beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Tools' translated
		edge: #right
		color: Color orange lighter.
	_gsSqueakTemp_aFlapTab position: self currentWorld width - _gsSqueakTemp_aFlapTab width @ (Display height - _gsSqueakTemp_aFlapTab height // 2).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_aStrip extent: 90 @ self currentWorld height.
	_gsSqueakTemp_aStrip beFlap: true.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Tools' translated"
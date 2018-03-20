predefined flaps
newSuppliesFlapFromQuads: quads positioning: positionSymbol 
	"Answer a fully-instantiated flap named 'Supplies' to be placed at the
	bottom of the screen. Use #center as the positionSymbol to have it
	centered at the bottom of the screen, or #right to have it placed off
	near the right edge."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_aStrip _gsSqueakTemp_hPosition |
	_gsSqueakTemp_aStrip := PartsBin
				newPartsBinWithOrientation: #leftToRight
				andColor: Color red muchLighter
				from: quads.
	"self twiddleSuppliesButtonsIn: aStrip."
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aStrip beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Supplies' translated
		edge: #bottom
		color: Color red lighter.
	_gsSqueakTemp_hPosition := positionSymbol == #center
				ifTrue: [Display width // 2 - (_gsSqueakTemp_aFlapTab width // 2)]
				ifFalse: [Display width - (_gsSqueakTemp_aFlapTab width + 22)].
	_gsSqueakTemp_aFlapTab position: _gsSqueakTemp_hPosition @ (self currentWorld height - _gsSqueakTemp_aFlapTab height).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_aStrip extent: self currentWorld width @ 136.
	_gsSqueakTemp_aStrip beFlap: true.
	_gsSqueakTemp_aStrip autoLineLayout: true.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Supplies' translated"
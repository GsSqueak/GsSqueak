color from user
fromUser
	"Displays a color palette of colors, waits for a mouse click, and returns
	the selected color. Any pixel on the Display can be chosen, not just
	those in the color palette."
	"Note: Since the color chart is cached, you may need to do 'ColorChart
	:= nil' after changing the oldColorPaletteForDepth:extent: method."
	"Color fromUser"
	| _gsSqueakTemp_d _gsSqueakTemp_startPt _gsSqueakTemp_save _gsSqueakTemp_tr _gsSqueakTemp_oldColor _gsSqueakTemp_c _gsSqueakTemp_here _gsSqueakTemp_s |
	_gsSqueakTemp_d := Display depth.
	(ColorChart == nil
			or: [ColorChart depth ~= Display depth])
		ifTrue: [ColorChart := self oldColorPaletteForDepth: _gsSqueakTemp_d extent: 2 * 144 @ 80].
	Sensor cursorPoint y < Display center y
		ifTrue: [_gsSqueakTemp_startPt := 0 @ (Display boundingBox bottom - ColorChart height)]
		ifFalse: [_gsSqueakTemp_startPt := 0 @ 0].
	_gsSqueakTemp_save := Form
				fromDisplay: (_gsSqueakTemp_startPt extent: ColorChart extent).
	ColorChart displayAt: _gsSqueakTemp_startPt.
	_gsSqueakTemp_tr := ColorChart extent - (50 @ 19) corner: ColorChart extent.
	_gsSqueakTemp_tr := _gsSqueakTemp_tr translateBy: _gsSqueakTemp_startPt.
	_gsSqueakTemp_oldColor := nil.
	[Sensor anyButtonPressed]
		whileFalse: [_gsSqueakTemp_c := Display colorAt: (_gsSqueakTemp_here := Sensor cursorPoint).
			(_gsSqueakTemp_tr containsPoint: _gsSqueakTemp_here)
				ifTrue: [_gsSqueakTemp_c := Color transparent.
					Display
						fill: (0 @ 61 + _gsSqueakTemp_startPt extent: 20 @ 19)
						fillColor: Color white]
				ifFalse: [Display
						fill: (0 @ 61 + _gsSqueakTemp_startPt extent: 20 @ 19)
						fillColor: _gsSqueakTemp_c].
			_gsSqueakTemp_c = _gsSqueakTemp_oldColor
				ifFalse: [Display
						fillWhite: (20 @ 61 + _gsSqueakTemp_startPt extent: 135 @ 19).
					_gsSqueakTemp_c isTransparent
						ifTrue: [_gsSqueakTemp_s := 'transparent']
						ifFalse: [_gsSqueakTemp_s := _gsSqueakTemp_c shortPrintString.
							_gsSqueakTemp_s := _gsSqueakTemp_s copyFrom: 7 to: _gsSqueakTemp_s size - 1].
					_gsSqueakTemp_s displayAt: 20 @ 61 + _gsSqueakTemp_startPt.
					_gsSqueakTemp_oldColor := _gsSqueakTemp_c]].
	_gsSqueakTemp_save displayAt: _gsSqueakTemp_startPt.
	Sensor waitNoButton.
	^ _gsSqueakTemp_c
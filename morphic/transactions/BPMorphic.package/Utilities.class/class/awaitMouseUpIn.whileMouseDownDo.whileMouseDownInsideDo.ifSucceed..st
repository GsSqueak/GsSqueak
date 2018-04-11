miscellaneous
awaitMouseUpIn: box whileMouseDownDo: doBlock1 whileMouseDownInsideDo: doBlock2 ifSucceed: succBlock 
	"The mouse has gone down in box; track the mouse, inverting the box
	while it's within, and if, on mouse up, the cursor was still within the
	box, execute succBlock. While waiting for the mouse to come up,
	repeatedly execute doBlock1, and also, if the cursor is within the box,
	execute doBlock2. 6/10/96 sw
	3/31/00 JMM added logic to stop multiple redraws"
	| _gsSqueakTemp_p _gsSqueakTemp_inside _gsSqueakTemp_lightForm _gsSqueakTemp_darkForm _gsSqueakTemp_isLight |
	_gsSqueakTemp_p := Sensor cursorPoint.
	_gsSqueakTemp_inside := box insetBy: 1.
	_gsSqueakTemp_isLight := true.
	_gsSqueakTemp_lightForm := Form fromDisplay: _gsSqueakTemp_inside.
	_gsSqueakTemp_darkForm := _gsSqueakTemp_lightForm deepCopy reverse.
	[Sensor anyButtonPressed]
		whileTrue: [doBlock1 value.
			(box containsPoint: (_gsSqueakTemp_p := Sensor cursorPoint))
				ifTrue: [doBlock2 value.
					_gsSqueakTemp_isLight
						ifTrue: [_gsSqueakTemp_isLight := false.
							_gsSqueakTemp_darkForm displayAt: _gsSqueakTemp_inside origin]]
				ifFalse: [_gsSqueakTemp_isLight
						ifFalse: [_gsSqueakTemp_isLight := true.
							_gsSqueakTemp_lightForm displayAt: _gsSqueakTemp_inside origin]]].
	(box containsPoint: _gsSqueakTemp_p)
		ifTrue: [_gsSqueakTemp_lightForm displayAt: _gsSqueakTemp_inside origin.
			^ succBlock value]
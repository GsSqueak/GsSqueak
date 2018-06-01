postscript generation
getTransparencyUnificationLUT
	| _gsSqueakTemp_lut _gsSqueakTemp_transparentIndex |
	_gsSqueakTemp_lut := Array new: colors size.
	_gsSqueakTemp_transparentIndex := self indexOfColor: Color transparent.
	1
		to: colors size
		do: [:i | _gsSqueakTemp_lut
				at: i
				put: ((colors at: i)
							= Color transparent
						ifTrue: [_gsSqueakTemp_transparentIndex]
						ifFalse: [i])]
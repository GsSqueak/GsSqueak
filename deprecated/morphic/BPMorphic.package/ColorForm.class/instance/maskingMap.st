displaying
maskingMap
	"Return a color map that maps all colors except transparent to words
	of all ones. Used to create a mask for a Form whose transparent pixel
	value is zero."
	| _gsSqueakTemp_maskingMap |
	_gsSqueakTemp_maskingMap := Bitmap
				new: (1 bitShift: depth)
				withAll: 4294967295.
	1
		to: colors size
		do: [:i | (colors at: i) isTransparent
				ifTrue: [_gsSqueakTemp_maskingMap at: i put: 0]].
	colors size + 1
		to: _gsSqueakTemp_maskingMap size
		do: [:i | _gsSqueakTemp_maskingMap at: i put: 0].
	^ _gsSqueakTemp_maskingMap
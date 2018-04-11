accessing
colors: colorList 
	"Set my color palette to the given collection."
	| _gsSqueakTemp_colorArray _gsSqueakTemp_colorCount _gsSqueakTemp_newColors |
	colorList
		ifNil: [colors := cachedDepth := cachedColormap := nil.
			^ self].
	_gsSqueakTemp_colorArray := colorList asArray.
	_gsSqueakTemp_colorCount := _gsSqueakTemp_colorArray size.
	_gsSqueakTemp_newColors := Array
				new: (1 bitShift: self depth).
	1
		to: _gsSqueakTemp_newColors size
		do: [:i | i <= _gsSqueakTemp_colorCount
				ifTrue: [_gsSqueakTemp_newColors
						at: i
						put: (_gsSqueakTemp_colorArray at: i)]
				ifFalse: [_gsSqueakTemp_newColors at: i put: Color transparent]].
	colors := _gsSqueakTemp_newColors.
	cachedDepth := nil.
	cachedColormap := nil
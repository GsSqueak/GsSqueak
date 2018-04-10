color mapping
colormapIfNeededFor: destForm 
	| _gsSqueakTemp_newMap _gsSqueakTemp_color _gsSqueakTemp_pv |
	(self hasNonStandardPalette
			or: [destForm hasNonStandardPalette])
		ifFalse: [^ self colormapIfNeededForDepth: destForm depth].
	colors == nil
		ifTrue: ["use the standard colormap"
			^ super colormapIfNeededFor: destForm].
	(destForm depth = cachedDepth
			and: [cachedColormap isColormap])
		ifTrue: [^ cachedColormap].
	_gsSqueakTemp_newMap := WordArray
				new: (1 bitShift: self depth).
	1
		to: colors size
		do: [:i | 
			_gsSqueakTemp_color := colors at: i.
			_gsSqueakTemp_pv := destForm pixelValueFor: _gsSqueakTemp_color.
			(_gsSqueakTemp_pv = 0
					and: [_gsSqueakTemp_color isTransparent not])
				ifTrue: [_gsSqueakTemp_pv := 1].
			_gsSqueakTemp_newMap at: i put: _gsSqueakTemp_pv].
	cachedDepth := destForm depth.
	^ cachedColormap := ColorMap
				shifts: nil
				masks: nil
				colors: _gsSqueakTemp_newMap
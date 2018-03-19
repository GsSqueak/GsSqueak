color manipulation
colormapIfNeededForDepth: destDepth
  "Return a colormap for displaying the receiver at the given depth, or
	nil if no colormap is needed."

  | _gsSqueakTemp_newMap |
  colors == nil
    ifTrue: [ 
      "use the standard colormap"
      ^ Color colorMapIfNeededFrom: self depth to: destDepth ].
  (destDepth = cachedDepth and: [ cachedColormap isColormap not ])
    ifTrue: [ ^ cachedColormap ].
  _gsSqueakTemp_newMap := MyBitmap new: colors size.
  1 to: colors size do: [ :i | _gsSqueakTemp_newMap at: i put: ((colors at: i) pixelValueForDepth: destDepth) ].
  cachedDepth := destDepth.
  ^ cachedColormap := _gsSqueakTemp_newMap
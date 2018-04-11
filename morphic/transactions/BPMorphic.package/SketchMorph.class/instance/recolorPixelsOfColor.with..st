menu
recolorPixelsOfColor: originalColor with: newColor 
	"Let the user select a color to be remapped, and then a color to map
	that color to, then carry it out."
	| _gsSqueakTemp_d _gsSqueakTemp_newForm _gsSqueakTemp_map |
	_gsSqueakTemp_d := originalForm depth.
	_gsSqueakTemp_newForm := Form extent: originalForm extent depth: _gsSqueakTemp_d.
	_gsSqueakTemp_map := (Color cachedColormapFrom: _gsSqueakTemp_d to: _gsSqueakTemp_d) copy.
	_gsSqueakTemp_map
		at: (originalColor indexInMap: _gsSqueakTemp_map)
		put: (newColor pixelValueForDepth: _gsSqueakTemp_d).
	_gsSqueakTemp_newForm
		copyBits: _gsSqueakTemp_newForm boundingBox
		from: originalForm
		at: 0 @ 0
		colorMap: _gsSqueakTemp_map.
	self form: _gsSqueakTemp_newForm
menu
recolorPixelsOfColor: originalColor with: newColor
	"Let the user select a color to be remapped, and then a color to map that color to, then carry it out."
	| d newForm map |
	d := originalForm depth.
	newForm := Form extent: originalForm extent depth: d.
	map := (Color cachedColormapFrom: d to: d) copy.
	map at: (originalColor indexInMap: map) put: (newColor pixelValueForDepth: d).
	newForm copyBits: newForm boundingBox
		from: originalForm at: 0@0
		colorMap: map.
	self form: newForm.

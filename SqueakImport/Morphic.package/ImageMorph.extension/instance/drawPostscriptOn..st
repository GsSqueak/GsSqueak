*Morphic-MorphicExtras-*morphic-Postscript Canvases
drawPostscriptOn: aCanvas

	| top f2 c2 clrs |

	clrs := image colorsUsed.
	(clrs includes: Color transparent) 
		ifFalse: [^super drawPostscriptOn: aCanvas].		"no need for this, then"

	top := aCanvas topLevelMorph.
	f2 := Form extent: self extent depth: image depth.
	c2 := f2 getCanvas.
	c2 fillColor: Color white.
	c2 translateBy: bounds origin negated clippingTo: f2 boundingBox during: [ :c |
		top fullDrawOn: c
	].
	aCanvas paintImage: f2 at: bounds origin


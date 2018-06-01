geometry
overlapsShadowForm: itsShadow bounds: itsBounds
	"Answer true if itsShadow and my shadow overlap at all"
	| overlapExtent overlap myRect myShadow goalRect goalShadow bb |
	overlap := self fullBounds intersect: itsBounds.
	overlapExtent := overlap extent.
	overlapExtent > (0 @ 0)
		ifFalse: [^ false].
	myRect := overlap translateBy: 0 @ 0 - self topLeft.
	myShadow := (self imageForm contentsOfArea: myRect) stencil.
	goalRect := overlap translateBy: 0 @ 0 - itsBounds topLeft.
	goalShadow := (itsShadow contentsOfArea: goalRect) stencil.

			"compute a pixel-by-pixel AND of the two stencils.  Result will be black 
			(pixel value = 1) where black parts of the stencils overlap"
			bb := BitBlt toForm: myShadow.
			bb 
				copyForm: goalShadow
				to: 0 @ 0
				rule: Form and.
	
	^(bb destForm tallyPixelValues second) > 0 
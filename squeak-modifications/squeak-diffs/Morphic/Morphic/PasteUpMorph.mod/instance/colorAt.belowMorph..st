world state
colorAt: aPoint belowMorph: aMorph
	"Return the color of the pixel immediately behind the given morph at the given point.
	NOTE: due to some bounds wobble in flexing, we take the middle of 3x3 rect."
	^ (self patchAt: (aPoint-1 extent: 3) without: aMorph andNothingAbove: true)
		colorAt: 1@1

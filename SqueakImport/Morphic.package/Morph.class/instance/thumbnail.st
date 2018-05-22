thumbnail
thumbnail
	"Answer an appropiate form to represent the receiver"

	| maxExtent fb |
	
	maxExtent := 320 @ 240.
	fb := self fullBounds.
	^ fb area <= (maxExtent x * maxExtent y)
		ifTrue: [self imageForm]
		ifFalse: [self imageFormForRectangle: (fb topLeft extent: maxExtent)]
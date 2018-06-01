display box access
computeBoundingBox 
	"Refer to the comment in DisplayObject|computeBoundingBox."

	| box |
	box := Rectangle origin: (self at: 1) extent: 0 @ 0.
	collectionOfPoints do: 
		[:aPoint | box swallow: (Rectangle origin: aPoint extent: 0 @ 0)].
	^box
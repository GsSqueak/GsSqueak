framing
initialFrameFor: aView initialExtent: initialExtent world: aWorld
	| scaledExtent |
	scaledExtent := (initialExtent * self scaleFactor) rounded.

	self placeWindowsAtPointer ifTrue: 
		[^self initialFrameAtPointerFor: aView initialExtent: scaledExtent world: aWorld].

	^ Preferences reverseWindowStagger
		ifTrue: [self strictlyStaggeredInitialFrameFor: aView initialExtent: scaledExtent world: aWorld]
		ifFalse: [self normalInitialFrameFor: aView initialExtent: scaledExtent world: aWorld]
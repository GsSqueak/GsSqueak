framing
initialFrameFor: aView initialExtent: initialExtent world: aWorld 
	| _gsSqueakTemp_scaledExtent |
	_gsSqueakTemp_scaledExtent := (initialExtent * self scaleFactor) rounded.
	^ Preferences reverseWindowStagger
		ifTrue: [self
				strictlyStaggeredInitialFrameFor: aView
				initialExtent: _gsSqueakTemp_scaledExtent
				world: aWorld]
		ifFalse: [self
				normalInitialFrameFor: aView
				initialExtent: _gsSqueakTemp_scaledExtent
				world: aWorld]
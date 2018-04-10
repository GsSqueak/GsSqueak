accessing
image: anImage 
	self changed.
	image := anImage depth = 1
				ifTrue: [ColorForm mappingWhiteToTransparentFrom: anImage]
				ifFalse: [anImage].
	super extent: self preferredExtent
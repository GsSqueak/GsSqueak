accessing
preferredExtent
	^ image
		ifNil: [0 @ 0]
		ifNotNil: [image extent]
private
availableGraphicsExtent
	^ self codeTextMorph
		ifNotNil: [:m | m innerBounds extent - (6 @ 22)]
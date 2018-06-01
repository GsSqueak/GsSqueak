misc
fitContents
	self isCurrentlyTextual
		ifFalse: [^ super fitContents].
	self
		ifVertical: [self extent: submorphs first extent + (2 * self borderWidth) + (0 @ 4).
			submorphs first position: self position + self borderWidth + (1 @ 4)]
		ifHorizontal: [self extent: submorphs first extent + (2 * self borderWidth) + (8 @ -1).
			submorphs first position: self position + self borderWidth + (5 @ 1)]
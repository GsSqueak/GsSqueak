-Etoys
scriptPerformer
	^ self topRendererOrSelf player
		ifNil: [self]
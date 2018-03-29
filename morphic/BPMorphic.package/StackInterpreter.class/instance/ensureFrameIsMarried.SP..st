frame access
ensureFrameIsMarried: theFP SP: theSP 
	(self frameHasContext: theFP)
		ifTrue: [self
				assert: (objectMemory
						isContext: (self frameContext: theFP)).
			^ self frameContext: theFP].
	^ self marryFrame: theFP SP: theSP
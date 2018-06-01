objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm 
	borderWidth
		ifNil: [borderWidth := 0.
			self removeProperty: #fillStyle].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm
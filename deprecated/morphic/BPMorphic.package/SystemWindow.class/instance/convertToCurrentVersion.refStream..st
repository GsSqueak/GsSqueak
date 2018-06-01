object fileIn
convertToCurrentVersion: varDict refStream: smartRefStrm 
	allowReframeHandles
		ifNil: [allowReframeHandles := true].
	self layoutPolicy
		ifNil: [self convertAlignment].
	labelArea
		ifNil: [self convertAlignment].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm
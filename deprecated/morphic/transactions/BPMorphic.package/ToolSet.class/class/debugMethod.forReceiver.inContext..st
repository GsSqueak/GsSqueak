debugging
debugMethod: aCompiledMethod forReceiver: anObject inContext: aContext 
	self default
		ifNil: [^ self inform: 'Cannot debug method.'].
	^ self default
		debugMethod: aCompiledMethod
		forReceiver: anObject
		inContext: aContext
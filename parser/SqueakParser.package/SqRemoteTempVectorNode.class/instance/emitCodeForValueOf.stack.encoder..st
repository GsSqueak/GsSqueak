code generation
emitCodeForValueOf: aTempVariableNode stack: stack encoder: encoder 
	encoder genPushRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index.
	stack push: 1
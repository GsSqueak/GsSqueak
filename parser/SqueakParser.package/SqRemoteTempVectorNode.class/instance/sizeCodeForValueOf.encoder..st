code generation
sizeCodeForValueOf: aTempVariableNode encoder: encoder 
	^ encoder sizePushRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index
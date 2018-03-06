code generation
emitCodeForStoreInto: aTempVariableNode stack: stack encoder: encoder 
	encoder genStoreRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index
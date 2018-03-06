code generation
emitCodeForStorePopInto: aTempVariableNode stack: stack encoder: encoder 
	encoder genStorePopRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index.
	stack pop: 1
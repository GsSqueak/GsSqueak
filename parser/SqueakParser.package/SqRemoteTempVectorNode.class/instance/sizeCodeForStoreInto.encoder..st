code generation
sizeCodeForStoreInto: aTempVariableNode encoder: encoder 
	^ encoder sizeStoreRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index
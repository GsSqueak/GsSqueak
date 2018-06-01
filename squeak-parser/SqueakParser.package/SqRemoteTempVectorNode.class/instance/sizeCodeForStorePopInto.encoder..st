code generation
sizeCodeForStorePopInto: aTempVariableNode encoder: encoder 
	^ encoder sizeStorePopRemoteTemp: (remoteTemps indexOf: aTempVariableNode)
			- 1 inVectorAt: index
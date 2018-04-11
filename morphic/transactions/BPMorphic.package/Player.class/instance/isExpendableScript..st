scripts-kernel
isExpendableScript: aScriptName 
	^ (self isEmptyTileScript: aScriptName)
		and: [aScriptName beginsWith: 'script' translated]
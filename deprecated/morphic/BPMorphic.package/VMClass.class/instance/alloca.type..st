C library extensions
alloca: numElements type: elementType 
	^ CArrayAccessor
		on: ((1 to: numElements)
				collect: [:ign | elementType new])
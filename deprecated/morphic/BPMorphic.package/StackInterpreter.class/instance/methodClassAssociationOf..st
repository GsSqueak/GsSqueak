compiled methods
methodClassAssociationOf: methodPointer 
	^ self literal: (objectMemory literalCountOf: methodPointer)
			- 1 ofMethod: methodPointer
compiled methods
methodClassOf: methodPointer

	^ objectMemory fetchPointer: ValueIndex ofObject: (self literal: (self literalCountOf: methodPointer) - 1 ofMethod: methodPointer)
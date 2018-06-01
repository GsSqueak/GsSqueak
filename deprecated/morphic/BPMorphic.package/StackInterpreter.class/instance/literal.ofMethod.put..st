compiled methods
literal: offset ofMethod: methodPointer put: oop 
	objectMemory
		storePointer: offset + LiteralStart
		ofObject: methodPointer
		withValue: oop
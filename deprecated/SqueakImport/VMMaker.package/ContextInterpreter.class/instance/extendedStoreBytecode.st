stack bytecodes
extendedStoreBytecode
	| descriptor variableType variableIndex association |
	<inline: true>
	descriptor := self fetchByte.
	self fetchNextBytecode.
	variableType := descriptor >> 6 bitAnd: 3.
	variableIndex := descriptor bitAnd: 63.
	variableType = 0
		ifTrue: [^ objectMemory storePointer: variableIndex ofObject: receiver withValue: self internalStackTop].
	variableType = 1
		ifTrue: [^ objectMemory storePointerUnchecked: variableIndex + TempFrameStart ofObject: localHomeContext withValue: self internalStackTop].
	variableType = 2
		ifTrue: [self error: 'illegal store'].
	variableType = 3
		ifTrue: [association := self literal: variableIndex.
			^ objectMemory storePointer: ValueIndex ofObject: association withValue: self internalStackTop]
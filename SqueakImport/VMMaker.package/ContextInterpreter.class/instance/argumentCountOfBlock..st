contexts
argumentCountOfBlock: blockPointer

	| localArgCount |
	localArgCount := objectMemory fetchPointer: BlockArgumentCountIndex ofObject: blockPointer.
	^self checkedIntegerValueOf: localArgCount
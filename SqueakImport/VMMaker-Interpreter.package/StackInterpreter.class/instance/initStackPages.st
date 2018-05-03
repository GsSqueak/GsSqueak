initialization
initStackPages
	"Initialize the stackPages.  This version is only for simulation
	 because Slang refuses to inline it, which makes the alloca invalid."
	| stackPageBytes stackPagesBytes theStackMemory |
	stackPageBytes := self stackPageByteSize.
	stackPagesBytes := self computeStackZoneSize.
	theStackMemory := self
						cCode: 'alloca(stackPagesBytes)'
						inSmalltalk:
							[stackPages := self stackPagesClass new.
							 stackPages initializeWithByteSize: stackPagesBytes for: self].
	stackPages
		initializeStack: theStackMemory
		numSlots: stackPagesBytes / objectMemory bytesPerWord
		pageSize: stackPageBytes / objectMemory bytesPerWord
		stackLimitOffset: self stackLimitOffset
		stackPageHeadroom: self stackPageHeadroom
sista bytecodes
jumpUnaryInlinePrimitive: primIndex 
	"6000	backjumpNoInterrupt
	literal which is a Smi"
	| _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	primIndex = 0
		ifTrue: [self
				assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
			self assert: (objectMemory integerValueOf: _gsSqueakTemp_top)
					< 0.
			"We've already fetched next bytecode, so we add -1"
			localIP := localIP
						+ (objectMemory integerValueOf: _gsSqueakTemp_top) - 1.
			self fetchNextBytecode.
			^ self internalPop: 1].
	^ self unknownInlinePrimitive
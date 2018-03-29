debug support
context: aContext hasValidInversePCMappingOf: theIP in: theFP 
	"For asserts. Check that theIP maps back correctly to the context's pc.
	The CallPrimitive bytecode presents a complication."
	| _gsSqueakTemp_pc _gsSqueakTemp_encodedip |
	_gsSqueakTemp_pc := objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext.
	_gsSqueakTemp_encodedip := self contextInstructionPointer: theIP frame: theFP.
	^ (objectMemory hasSpurMemoryManagerAPI
			or: [MULTIPLEBYTECODESETS])
		ifTrue: [_gsSqueakTemp_pc = _gsSqueakTemp_encodedip
				or: [| methodHeader |
					methodHeader := objectMemory
								methodHeaderOf: (objectMemory fetchPointer: MethodIndex ofObject: aContext).
					(self methodHeaderHasPrimitive: methodHeader)
						and: [(objectMemory integerValueOf: _gsSqueakTemp_encodedip)
								- (objectMemory integerValueOf: _gsSqueakTemp_pc)
								= (self sizeOfCallPrimitiveBytecode: methodHeader)]]]
		ifFalse: [_gsSqueakTemp_pc = _gsSqueakTemp_encodedip]
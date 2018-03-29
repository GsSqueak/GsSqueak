sista bytecodes
jumpBinaryInlinePrimitive: primIndex 
	| _gsSqueakTemp_test _gsSqueakTemp_offset _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_offset := objectMemory integerValueOf: _gsSqueakTemp_top.
	_gsSqueakTemp_test := self internalStackValue: 1.
	self assert: _gsSqueakTemp_offset >= 0.
	primIndex caseOf: {
		["7016	jumpIfWritable:
		Not a forwarder, literal which is a Smi"
		16] -> 
			[self
				deny: (objectMemory isOopForwarded: _gsSqueakTemp_test).
			self
				deny: (objectMemory isImmediate: _gsSqueakTemp_test).
			(objectMemory isImmutable: _gsSqueakTemp_test)
				ifFalse: [localIP := localIP + _gsSqueakTemp_offset]].
		["7017	jumpIfReadOnly:
		Not a forwarder, literal which is a Smi"
		17] -> 
			[self
				deny: (objectMemory isOopForwarded: _gsSqueakTemp_test).
			self
				deny: (objectMemory isImmediate: _gsSqueakTemp_test).
			(objectMemory isImmutable: _gsSqueakTemp_test)
				ifTrue: [localIP := localIP + _gsSqueakTemp_offset]].
		["7018	jumpIfYoung:
		Not a forwarder, literal which is a Smi"
		18] -> 
			[self
				deny: (objectMemory isOopForwarded: _gsSqueakTemp_test).
			self
				deny: (objectMemory isImmediate: _gsSqueakTemp_test).
			(objectMemory isYoungObject: _gsSqueakTemp_test)
				ifTrue: [localIP := localIP + _gsSqueakTemp_offset]].
		["7019	jumpIfOld:
		Not a forwarder, literal which is a Smi"
		19] -> 
			[self
				deny: (objectMemory isOopForwarded: _gsSqueakTemp_test).
			self
				deny: (objectMemory isImmediate: _gsSqueakTemp_test).
			(objectMemory isYoungObject: _gsSqueakTemp_test)
				ifFalse: [localIP := localIP + _gsSqueakTemp_offset]]}.
	localIP := localIP - 1.
	"we've already fetched, but we may have incorrectly fetched if jump"
	self fetchNextBytecode.
	self internalPop: 2
sista bytecodes
jumpTrinaryInlinePrimitive: primIndex 
	"Note: those tests work with forwarders (wrong class index)"
	| _gsSqueakTemp_test _gsSqueakTemp_classObj _gsSqueakTemp_offset _gsSqueakTemp_classTag _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_offset := objectMemory integerValueOf: _gsSqueakTemp_top.
	self assert: _gsSqueakTemp_offset >= 0.
	_gsSqueakTemp_test := self internalStackValue: 2.
	_gsSqueakTemp_classObj := self internalStackValue: 1.
	self
		assert: (objectMemory isNonImmediate: _gsSqueakTemp_classObj).
	primIndex caseOf: {
		[0] -> 
			["8000	jumpIfInstanceOf:distance:
			Anything, literal which is a Behavior, literal which is a Smi"
			self
				assert: (self objCouldBeClassObj: _gsSqueakTemp_classObj).
			_gsSqueakTemp_classTag := objectMemory fetchClassTagOf: _gsSqueakTemp_test.
			_gsSqueakTemp_classTag
					= (objectMemory rawClassTagForClass: _gsSqueakTemp_classObj)
				ifTrue: [localIP := localIP + _gsSqueakTemp_offset]].
		[1] -> 
			["8001	jumpIfNotInstanceOf:distance:
			Anything, literal which is a Behavior, literal which is a Smi"
			self
				assert: (self objCouldBeClassObj: _gsSqueakTemp_classObj).
			_gsSqueakTemp_classTag := objectMemory fetchClassTagOf: _gsSqueakTemp_test.
			_gsSqueakTemp_classTag
					= (objectMemory rawClassTagForClass: _gsSqueakTemp_classObj)
				ifFalse: [localIP := localIP + _gsSqueakTemp_offset]].
		[2] -> 
			["8002	jumpIfInstanceOfOneOf:distance:
			Anything, Array of behaviors, literal which is a Smi"
			self
				assert: (objectMemory isArrayNonImm: _gsSqueakTemp_classObj).
			_gsSqueakTemp_classTag := objectMemory fetchClassTagOf: _gsSqueakTemp_test.
			0
				to: (objectMemory numSlotsOf: _gsSqueakTemp_classObj) asInteger - 1
				do: [:i | _gsSqueakTemp_classTag
							= (objectMemory
									rawClassTagForClass: (objectMemory fetchPointer: i ofObject: _gsSqueakTemp_classObj))
						ifTrue: [localIP := localIP + _gsSqueakTemp_offset]]].
		[3] -> 
			["8003	jumpIfNotInstanceOfOneOf:distance:
			Anything, Array of behaviors, literal which is a Smi"
			self
				assert: (objectMemory isArrayNonImm: _gsSqueakTemp_classObj).
			_gsSqueakTemp_classTag := objectMemory fetchClassTagOf: _gsSqueakTemp_test.
			0
				to: (objectMemory numSlotsOf: _gsSqueakTemp_classObj) asInteger - 1
				do: [:i | _gsSqueakTemp_classTag
							= (objectMemory
									rawClassTagForClass: (objectMemory fetchPointer: i ofObject: _gsSqueakTemp_classObj))
						ifTrue: [localIP := localIP - 1.
							self fetchNextBytecode.
							^ self internalPop: 3]].
			localIP := localIP + _gsSqueakTemp_offset]}.
	localIP := localIP - 1.
	"we've already fetched, but we may have incorrectly fetched if jump"
	self fetchNextBytecode.
	self internalPop: 3
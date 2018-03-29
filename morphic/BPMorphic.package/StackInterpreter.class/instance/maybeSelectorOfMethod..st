debug support
maybeSelectorOfMethod: methodObj 
	"Answer the selector of a method, assuming its penultimate literal is
	either a symbol or a pointer object whose first slot references the
	method and
	whose second slot is a symbol (i.e. an AdditionalMethodState). If a
	Symbol can't be found answer nil. This isn't satisfactory, as it puts a
	lot of information
	into the VM, but it is needed for adequate crash debugging at
	Cadence. With full blocks as of 9/2016 the last literal of a
	CompiledBlock is a back pointer
	to the enclosing block or compiled method."
	| _gsSqueakTemp_ultimateLiteral _gsSqueakTemp_penultimateLiteral _gsSqueakTemp_maybeSelector |
	self
		assert: (objectMemory isOopCompiledMethod: methodObj).
	_gsSqueakTemp_ultimateLiteral := self ultimateLiteralOf: methodObj.
	(objectMemory isOopCompiledMethod: _gsSqueakTemp_ultimateLiteral)
		ifTrue: [^ self maybeSelectorOfMethod: _gsSqueakTemp_ultimateLiteral].
	_gsSqueakTemp_penultimateLiteral := self penultimateLiteralOf: methodObj.
	(objectMemory isWordsOrBytes: _gsSqueakTemp_penultimateLiteral)
		ifTrue: [^ (objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_penultimateLiteral)
					= (objectMemory
							fetchClassTagOfNonImm: (objectMemory splObj: SelectorDoesNotUnderstand))
				ifTrue: [_gsSqueakTemp_penultimateLiteral]].
	^ ((objectMemory isPointers: _gsSqueakTemp_penultimateLiteral)
			and: [(objectMemory numSlotsOf: _gsSqueakTemp_penultimateLiteral)
						>= 2
					and: [(objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_penultimateLiteral)
								= methodObj
							and: [_gsSqueakTemp_maybeSelector := objectMemory fetchPointer: 1 ofObject: _gsSqueakTemp_penultimateLiteral.
								(objectMemory isWordsOrBytes: _gsSqueakTemp_maybeSelector)
									and: [(objectMemory fetchClassTagOfNonImm: _gsSqueakTemp_maybeSelector)
											= (objectMemory
													fetchClassTagOfNonImm: (objectMemory splObj: SelectorDoesNotUnderstand))]]]])
		ifTrue: [_gsSqueakTemp_maybeSelector]
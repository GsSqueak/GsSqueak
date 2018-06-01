compiled methods
methodClassOf: methodPointer 
	"Answer the method class of a method which is the value of an
	Association in the last literal,
	or answer nil if there isn't one.
	Using a read barrier here simplifies the become implementation and
	costs very little
	because the class index and ValueIndex of the association almost
	certainly share a cache line."
	| _gsSqueakTemp_literal |
	_gsSqueakTemp_literal := self followLiteral: (objectMemory literalCountOf: methodPointer)
					- 1 ofMethod: methodPointer.
	^ (_gsSqueakTemp_literal ~= objectMemory nilObject
			and: [objectMemory isPointers: _gsSqueakTemp_literal])
		ifTrue: ["filters out fullBlock last literal"
			self assert: (objectMemory numSlotsOf: _gsSqueakTemp_literal)
					> ValueIndex.
			objectMemory followField: ValueIndex ofObject: _gsSqueakTemp_literal]
		ifFalse: [objectMemory nilObject]
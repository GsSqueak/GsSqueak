sista bytecodes
quinaryInlinePrimitive: primIndex 
	| _gsSqueakTemp_src _gsSqueakTemp_srcIndex _gsSqueakTemp_dest _gsSqueakTemp_destIndex _gsSqueakTemp_destLimit _gsSqueakTemp_oop |
	"0 is deprecated, now this can be handled at Scorch level"
	primIndex = 0
		ifTrue: ["Array copy, pointer variable object with no inst vars"
			_gsSqueakTemp_dest := self internalStackValue: 4.
			_gsSqueakTemp_destIndex := (objectMemory
						integerValueOf: (self internalStackValue: 3))
						- 1.
			_gsSqueakTemp_destLimit := (objectMemory
						integerValueOf: (self internalStackValue: 2))
						- 1.
			_gsSqueakTemp_src := self internalStackValue: 1.
			_gsSqueakTemp_srcIndex := (objectMemory
						integerValueOf: (self internalStackValue: 0))
						- 1.
			self internalPop: 4.
			_gsSqueakTemp_destLimit < _gsSqueakTemp_destIndex
				ifTrue: [^ self].
			(objectMemory isYoung: _gsSqueakTemp_dest)
				ifFalse: [objectMemory possibleRootStoreInto: _gsSqueakTemp_dest].
			0
				to: _gsSqueakTemp_destLimit - _gsSqueakTemp_destIndex
				do: [:i | 
					_gsSqueakTemp_oop := objectMemory fetchPointer: _gsSqueakTemp_srcIndex + i ofObject: _gsSqueakTemp_src.
					objectMemory
						storePointerUnchecked: _gsSqueakTemp_destIndex + i
						ofObject: _gsSqueakTemp_dest
						withValue: _gsSqueakTemp_oop].
			^ self].
	self unknownInlinePrimitive
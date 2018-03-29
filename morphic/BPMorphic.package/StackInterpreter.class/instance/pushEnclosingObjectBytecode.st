stack bytecodes
pushEnclosingObjectBytecode
	"Find the enclosing object at level N"
	| _gsSqueakTemp_litIndex _gsSqueakTemp_n _gsSqueakTemp_anIntOop |
	_gsSqueakTemp_litIndex := self fetchByte.
	_gsSqueakTemp_anIntOop := self literal: _gsSqueakTemp_litIndex.
	_gsSqueakTemp_n := (objectMemory isIntegerObject: _gsSqueakTemp_anIntOop)
				ifTrue: [objectMemory integerValueOf: _gsSqueakTemp_anIntOop]
				ifFalse: [0].
	self fetchNextBytecode.
	self
		internalPush: (self
				enclosingObjectAt: _gsSqueakTemp_n
				withObject: self receiver
				withMixin: (self methodClassOf: method))
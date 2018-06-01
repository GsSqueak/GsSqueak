stack bytecodes
storeLiteralVariable: literalIndex withValue: anObject 
	| _gsSqueakTemp_litVar |
	_gsSqueakTemp_litVar := self literal: literalIndex.
	"push/store/popLiteralVariable all fetch a literal, and either read or
	write the literal's value field.
	The fetch of the literal needs an explicit check (otherwise we would
	have to scan all literals in
	all methods in the stack zone, and the entire method on return, and
	global variables are relatively
	rare; in my work image 8.7% of literals are globals)."
	(objectMemory isForwarded: _gsSqueakTemp_litVar)
		ifTrue: [_gsSqueakTemp_litVar := objectMemory followForwarded: _gsSqueakTemp_litVar.
			self
				literal: literalIndex
				ofMethod: method
				put: _gsSqueakTemp_litVar].
	objectMemory
		storePointerImmutabilityCheck: ValueIndex
		ofObject: _gsSqueakTemp_litVar
		withValue: anObject
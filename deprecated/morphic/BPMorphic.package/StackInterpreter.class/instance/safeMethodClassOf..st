compiled methods
safeMethodClassOf: methodPointer 
	"Safe version of methodClassOf: that deals with malformed compiled
	methods, etc, and does not fixup forwarding pointers.."
	| _gsSqueakTemp_literal _gsSqueakTemp_maybeClass |
	_gsSqueakTemp_literal := self literal: (objectMemory literalCountOf: methodPointer)
					- 1 ofMethod: methodPointer.
	(objectMemory isOopForwarded: _gsSqueakTemp_literal)
		ifTrue: [_gsSqueakTemp_literal := objectMemory followForwarded: _gsSqueakTemp_literal].
	((objectMemory isPointers: _gsSqueakTemp_literal)
			and: [(objectMemory numSlotsOf: _gsSqueakTemp_literal)
					> ValueIndex])
		ifFalse: [^ objectMemory nilObject].
	_gsSqueakTemp_maybeClass := objectMemory fetchPointer: ValueIndex ofObject: _gsSqueakTemp_literal.
	(objectMemory isOopForwarded: _gsSqueakTemp_maybeClass)
		ifTrue: [_gsSqueakTemp_maybeClass := objectMemory followForwarded: _gsSqueakTemp_maybeClass].
	^ _gsSqueakTemp_maybeClass
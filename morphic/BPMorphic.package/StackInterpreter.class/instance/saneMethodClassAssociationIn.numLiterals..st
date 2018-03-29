compiled methods
saneMethodClassAssociationIn: methodObj numLiterals: numLiterals 
	| _gsSqueakTemp_shouldBeAssoc |
	_gsSqueakTemp_shouldBeAssoc := self literal: numLiterals - 1 ofMethod: methodObj.
	(objectMemory isForwarded: _gsSqueakTemp_shouldBeAssoc)
		ifTrue: [_gsSqueakTemp_shouldBeAssoc := objectMemory followForwarded: _gsSqueakTemp_shouldBeAssoc].
	^ (objectMemory isPointers: _gsSqueakTemp_shouldBeAssoc)
		and: [(objectMemory numSlotsOf: _gsSqueakTemp_shouldBeAssoc)
					> ValueIndex
				and: [self
						addressCouldBeClassObj: (objectMemory noFixupFollowField: ValueIndex ofObject: _gsSqueakTemp_shouldBeAssoc)]]
Nebraska support
valuesForHand: anEventOrHand 
	| _gsSqueakTemp_hand _gsSqueakTemp_valuesForHand |
	forEachHand
		ifNil: [forEachHand := IdentityDictionary new].
	_gsSqueakTemp_hand := (anEventOrHand isKindOf: HandMorph)
				ifTrue: [anEventOrHand]
				ifFalse: [anEventOrHand hand].
	_gsSqueakTemp_valuesForHand := forEachHand
				at: _gsSqueakTemp_hand
				ifAbsentPut: [Dictionary new].
	^ _gsSqueakTemp_valuesForHand
Nebraska support
valuesForHandIfPresent: anEventOrHand 
	| _gsSqueakTemp_hand |
	forEachHand
		ifNil: [forEachHand := IdentityDictionary new].
	_gsSqueakTemp_hand := anEventOrHand isHandMorph
				ifTrue: [anEventOrHand]
				ifFalse: [anEventOrHand hand].
	^ forEachHand
		at: _gsSqueakTemp_hand
		ifAbsent: []
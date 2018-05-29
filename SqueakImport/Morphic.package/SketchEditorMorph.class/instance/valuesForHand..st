Nebraska support
valuesForHand: anEventOrHand

	| hand valuesForHand |
	forEachHand ifNil: [forEachHand := IdentityDictionary new].
	hand := (anEventOrHand isKindOf: HandMorph) 
				ifTrue: [anEventOrHand] ifFalse: [anEventOrHand hand].
	valuesForHand := forEachHand at: hand ifAbsentPut: [Dictionary new].
	^valuesForHand


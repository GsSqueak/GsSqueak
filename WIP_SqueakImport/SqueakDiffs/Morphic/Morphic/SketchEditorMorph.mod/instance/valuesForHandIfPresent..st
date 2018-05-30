Nebraska support
valuesForHandIfPresent: anEventOrHand 
	| hand |
	forEachHand ifNil: [forEachHand := IdentityDictionary new].
	hand := (anEventOrHand isHandMorph) 
				ifTrue: [anEventOrHand]
				ifFalse: [anEventOrHand hand].
	^forEachHand at: hand ifAbsent: [nil]
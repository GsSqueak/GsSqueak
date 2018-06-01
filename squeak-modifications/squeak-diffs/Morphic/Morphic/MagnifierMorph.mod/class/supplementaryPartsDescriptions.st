parts bin
supplementaryPartsDescriptions
	^ {DescriptionForPartsBin
		formalName: 'RoundGlass' translatedNoop
		categoryList: {'Just for Fun' translatedNoop}
		documentation: 'A round magnifying glass' translatedNoop
		globalReceiverSymbol: #MagnifierMorph
		nativitySelector: #newRound.
		
	DescriptionForPartsBin
		formalName: 'Hand Magnifier' translatedNoop
		categoryList: #()
		documentation: 'A magnifying glass that also shows Morphs in the Hand and displays the Hand position.' translatedNoop
		globalReceiverSymbol: #MagnifierMorph
		nativitySelector: #newShowingPointer }
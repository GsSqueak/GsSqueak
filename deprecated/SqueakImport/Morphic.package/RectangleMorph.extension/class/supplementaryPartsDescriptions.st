*Morphic-MorphicExtras-parts bin
supplementaryPartsDescriptions
	^ {DescriptionForPartsBin
		formalName: 'RoundRect' translatedNoop
		categoryList: {'Graphics' translatedNoop. 'Basic' translatedNoop}
		documentation: 'A rectangle with rounded corners' translatedNoop
		globalReceiverSymbol: #RectangleMorph
		nativitySelector: #roundRectPrototype.

	DescriptionForPartsBin
		formalName: 'Gradient' translatedNoop
		categoryList: #()
		documentation: 'A rectangle with a horizontal gradient' translatedNoop
		globalReceiverSymbol: #RectangleMorph
		nativitySelector: #gradientPrototype.

	DescriptionForPartsBin
		formalName: 'Gradient (slanted)' translatedNoop
		categoryList: #()
		documentation: 'A rectangle with a diagonal gradient' translatedNoop
		globalReceiverSymbol: #RectangleMorph
		nativitySelector: #diagonalPrototype}
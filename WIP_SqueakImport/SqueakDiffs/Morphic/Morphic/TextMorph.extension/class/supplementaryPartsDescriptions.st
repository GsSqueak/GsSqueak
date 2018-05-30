*Morphic-MorphicExtras-parts bin
supplementaryPartsDescriptions
	"Answer a list of DescriptionForPartsBin objects that characterize objects that this class wishes to contribute to Stationery bins *other* than by the standard default #newStandAlone protocol"

	^ {
	DescriptionForPartsBin
		formalName: 'Text (border)' translatedNoop
		categoryList: #()
		documentation: 'A text field with border' translatedNoop
		globalReceiverSymbol: #TextMorph
		nativitySelector: #borderedPrototype.

"	DescriptionForPartsBin
		formalName: 'Text (fancy)' translatedNoop
		categoryList: {'Text' translatedNoop}
		documentation: 'A text field with a rounded shadowed border, with a fancy font.' translatedNoop
		globalReceiverSymbol: #TextMorph
		nativitySelector: #fancyPrototype."

	DescriptionForPartsBin
		formalName: 'Text' translatedNoop
		categoryList: {'Basic' translatedNoop}
		documentation: 
			'A raw piece of text which you can edit into anything you want' translatedNoop
		globalReceiverSymbol: #TextMorph
		nativitySelector: #nonwrappingPrototype.
}

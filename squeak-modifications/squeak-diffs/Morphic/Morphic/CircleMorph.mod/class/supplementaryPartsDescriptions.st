as yet unclassified
supplementaryPartsDescriptions
	"Extra items for parts bins"

	^ {DescriptionForPartsBin
		formalName: 'Circle' translatedNoop
		categoryList: {'Graphics' translatedNoop}
		documentation: 'A circular shape' translatedNoop
		globalReceiverSymbol: #CircleMorph 
		nativitySelector: #newStandAlone.

	DescriptionForPartsBin
		formalName: 'Pin' translatedNoop
		categoryList: {'Connectors' translatedNoop}
		documentation: 'An attachment point for Connectors that you can embed in another Morph.' translatedNoop
		globalReceiverSymbol: #NCPinMorph 
		nativitySelector: #newPin.
}
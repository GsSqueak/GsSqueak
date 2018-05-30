*Morphic-MorphicExtras-new-morph participation
addPartsDescriptorQuadsTo: aList if: aBlock
	"For each of the standard objects to be put into parts bins based on declarations in this class, add a parts-launching quintuplet to aList, provided that the boolean-valued-block-with-one-argument supplied evaluates to true when provided the DescriptionForPartsBin"

	| info more |
	(self class includesSelector: #descriptionForPartsBin) ifTrue:
		[info := self descriptionForPartsBin.
		(aBlock value: info) ifTrue:
			[aList add:
				{info globalReceiverSymbol.
				info nativitySelector.
				info formalName.
				info documentation.
				info sampleImageFormOrNil}]].

	(self class includesSelector: #supplementaryPartsDescriptions)
		ifTrue:
			[more := self supplementaryPartsDescriptions.
			(more isKindOf: DescriptionForPartsBin) ifTrue: [more := Array with: more].
				"The above being a mild bit of forgiveness, so that in the usual only-one
				case, the user need not return a collection"
			more do:
				[:aPartsDescription |  (aBlock value: aPartsDescription) ifTrue:
					[aList add:
						{aPartsDescription globalReceiverSymbol.
						aPartsDescription nativitySelector.
						aPartsDescription formalName.
						aPartsDescription documentation.
						aPartsDescription sampleImageFormOrNil}]]]
character classification
generalCategoryOf: aCharacterCode

	| index |
	(index := aCharacterCode + 1) > GeneralCategory size ifTrue: [ ^nil ].
	^GeneralCategory at: index

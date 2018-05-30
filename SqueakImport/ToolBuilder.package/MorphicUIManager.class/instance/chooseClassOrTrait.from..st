ui requests
chooseClassOrTrait: label from: environment
	"Let the user choose a Class or Trait. Use ListChooser in Morphic."
	
	| names index |
	names := environment classAndTraitNames.
	index := self
		chooseFrom: names
		lines: #()
		title: label.
	index = 0 ifTrue: [ ^nil ].
	^environment
		at: (names at: index)
		ifAbsent: [ nil ]
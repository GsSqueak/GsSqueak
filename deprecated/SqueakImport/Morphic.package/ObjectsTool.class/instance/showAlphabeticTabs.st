alphabetic
showAlphabeticTabs
	"Switch to the mode of showing alphabetic tabs"

	modeSymbol == #alphabetic ifTrue: [ ^self ].
	self partsBin removeAllMorphs.
	self initializeWithTabs: self alphabeticTabs.
	self modeSymbol: #alphabetic.
	self tabsPane submorphs first doButtonAction
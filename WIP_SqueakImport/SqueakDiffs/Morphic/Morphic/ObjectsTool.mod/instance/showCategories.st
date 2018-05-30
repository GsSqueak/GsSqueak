categories
showCategories
	"Set the receiver up so that it shows tabs for each of the standard categories"

	modeSymbol == #categories ifTrue: [ ^self ].

	self partsBin removeAllMorphs.
	self initializeWithTabs: self tabsForCategories.
	self modeSymbol: #categories.
	self tabsPane submorphs first doButtonAction.

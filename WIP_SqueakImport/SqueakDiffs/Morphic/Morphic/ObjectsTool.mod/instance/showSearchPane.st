search
showSearchPane
	"Set the receiver up so that it shows the search pane"

	| tabsPane aPane frame |
	modeSymbol == #search ifTrue: [ ^self ].

	self partsBin removeAllMorphs.

	tabsPane := self tabsPane.
	aPane := self newSearchPane.
	aPane layoutChanged; fullBounds.

	aPane layoutFrame: (frame := tabsPane layoutFrame copy).
	frame bottomOffset: (frame topOffset + aPane height).
	self replaceSubmorph: tabsPane by: aPane.
	self partsBin layoutFrame topOffset: frame bottomOffset.

	self modeSymbol: #search.
	self showMorphsMatchingSearchString.
	ActiveHand newKeyboardFocus: aPane
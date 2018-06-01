alphabetic
installQuads: quads fromButton: aButton
	"Install items in the bottom pane that correspond to the given set of quads, as triggered from the given button"

	| aPartsBin sortedQuads oldResizing |
	aPartsBin := self partsBin.
	oldResizing := aPartsBin vResizing.
	aPartsBin removeAllMorphs.
	sortedQuads := ((PartsBin translatedQuads: quads)
		select: [ :each | Smalltalk hasClassNamed: each first ])
		sort: [ :a :b | a third < b third ].
	aPartsBin listDirection: #leftToRight quadList: sortedQuads.
	aButton ifNotNil: [self tabsPane highlightOnlySubmorph: aButton].
	aPartsBin vResizing: oldResizing.
	aPartsBin layoutChanged; fullBounds.
	self isFlap ifFalse: [ self minimizePartsBinSize ].
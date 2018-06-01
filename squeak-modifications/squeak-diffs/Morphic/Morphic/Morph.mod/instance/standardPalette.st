initialization
standardPalette
	"Answer a standard palette forced by some level of enclosing presenter, or nil if none"
	| pal aPresenter itsOwner |
	(aPresenter := self presenter) ifNil: [^ nil].
	^ (pal := aPresenter ownStandardPalette)
		ifNotNil: [pal]
		ifNil:	[(itsOwner := aPresenter associatedMorph owner)
					ifNotNil:
						[itsOwner standardPalette]
					ifNil:
						[nil]]
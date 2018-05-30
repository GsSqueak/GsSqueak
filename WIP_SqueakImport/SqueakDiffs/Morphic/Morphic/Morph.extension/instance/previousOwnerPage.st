*Morphic-MorphicExtras
previousOwnerPage
	"Tell my container to advance to the previous page"
	| targ |
	targ := self ownerThatIsA: BookMorph.
	targ ifNotNil: [targ previousPage]
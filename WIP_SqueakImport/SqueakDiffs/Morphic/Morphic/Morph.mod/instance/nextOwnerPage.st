*Morphic-MorphicExtras
nextOwnerPage
	"Tell my container to advance to the next page"
	| targ |
	targ := self ownerThatIsA: BookMorph.
	targ ifNotNil: [targ nextPage]
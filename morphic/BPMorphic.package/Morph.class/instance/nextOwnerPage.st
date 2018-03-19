-MorphicExtras
nextOwnerPage
	"Tell my container to advance to the next page"
	| _gsSqueakTemp_targ |
	_gsSqueakTemp_targ := self ownerThatIsA: BookMorph.
	_gsSqueakTemp_targ
		ifNotNil: [_gsSqueakTemp_targ nextPage]
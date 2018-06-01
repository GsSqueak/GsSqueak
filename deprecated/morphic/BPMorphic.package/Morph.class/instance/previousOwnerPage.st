-MorphicExtras
previousOwnerPage
	"Tell my container to advance to the previous page"
	| _gsSqueakTemp_targ |
	_gsSqueakTemp_targ := self ownerThatIsA: BookMorph.
	_gsSqueakTemp_targ
		ifNotNil: [_gsSqueakTemp_targ previousPage]
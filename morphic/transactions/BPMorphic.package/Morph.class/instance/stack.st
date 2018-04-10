-Etoys-card in a stack
stack
	"Answer the nearest containing Stack, or, if none, a stack in the
	current project, and if still none, nil. The extra messiness is because
	uninstalled backgrounds don't have an owner pointers to their stack."
	| _gsSqueakTemp_bkgnd |
	_gsSqueakTemp_bkgnd := self
				orOwnerSuchThat: [:oo | oo hasProperty: #myStack].
	_gsSqueakTemp_bkgnd
		ifNotNil: [^ _gsSqueakTemp_bkgnd valueOfProperty: #myStack].
	"fallbacks"
	(self ownerThatIsA: StackMorph)
		ifNotNil: [:_gsSqueakTemp_aStack | ^ _gsSqueakTemp_aStack].
	^ Project current currentStack
layout
fullBounds
	"Extend my bounds by the shadow offset when carrying morphs."
	| _gsSqueakTemp_bnds |
	_gsSqueakTemp_bnds := super fullBounds.
	submorphs isEmpty
		ifTrue: [^ _gsSqueakTemp_bnds]
		ifFalse: [^ _gsSqueakTemp_bnds topLeft corner: _gsSqueakTemp_bnds bottomRight + self shadowOffset]
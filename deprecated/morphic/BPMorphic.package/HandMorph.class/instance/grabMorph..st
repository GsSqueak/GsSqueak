meta-actions
grabMorph: aMorph 
	"Grab the given morph (i.e., add it to this hand and remove it from its
	current owner) without changing its position. This is used to pick up a
	morph under the hand's current position, versus attachMorph: which
	is used to pick up a morph that may not be near this hand."
	| _gsSqueakTemp_grabbed |
	self releaseMouseFocus.
	"Break focus"
	_gsSqueakTemp_grabbed := aMorph aboutToBeGrabbedBy: self.
	_gsSqueakTemp_grabbed
		ifNil: [^ self].
	_gsSqueakTemp_grabbed := _gsSqueakTemp_grabbed topRendererOrSelf.
	^ self grabMorph: _gsSqueakTemp_grabbed from: _gsSqueakTemp_grabbed owner
grabbing/dropping
grabMorph: aMorph from: formerOwner 
	"Grab the given morph (i.e., add it to this hand and remove it from its
	current owner) without changing its position. This is used to pick up a
	morph under the hand's current position, versus attachMorph: which
	is used to pick up a morph that may not be near this hand."
	| _gsSqueakTemp_grabbed _gsSqueakTemp_offset _gsSqueakTemp_targetPoint _gsSqueakTemp_grabTransform _gsSqueakTemp_fullTransform |
	self releaseMouseFocus.
	"Break focus"
	_gsSqueakTemp_grabbed := aMorph.
	aMorph keepsTransform
		ifTrue: [_gsSqueakTemp_grabTransform := _gsSqueakTemp_fullTransform := IdentityTransform new]
		ifFalse: ["Compute the transform to apply to the grabbed morph"
			_gsSqueakTemp_grabTransform := formerOwner
						ifNil: [IdentityTransform new]
						ifNotNil: [formerOwner grabTransform].
			"Compute the full transform for the grabbed morph"
			_gsSqueakTemp_fullTransform := formerOwner
						ifNil: [IdentityTransform new]
						ifNotNil: [formerOwner transformFrom: owner]].
	"targetPoint is point in aMorphs reference frame"
	_gsSqueakTemp_targetPoint := _gsSqueakTemp_fullTransform globalPointToLocal: self position.
	"but current position will be determined by grabTransform, so
	compute offset"
	_gsSqueakTemp_offset := _gsSqueakTemp_targetPoint
				- (_gsSqueakTemp_grabTransform globalPointToLocal: self position).
	"apply the transform that should be used after grabbing"
	_gsSqueakTemp_grabbed := _gsSqueakTemp_grabbed transformedBy: _gsSqueakTemp_grabTransform.
	_gsSqueakTemp_grabbed == aMorph
		ifFalse: [_gsSqueakTemp_grabbed setProperty: #addedFlexAtGrab toValue: true].
	"offset target to compensate for differences in transforms"
	_gsSqueakTemp_grabbed position: _gsSqueakTemp_grabbed position - _gsSqueakTemp_offset asIntegerPoint.
	"And compute distance from hand's position"
	targetOffset := _gsSqueakTemp_grabbed position - self position.
	self addMorphBack: _gsSqueakTemp_grabbed.
	_gsSqueakTemp_grabbed justGrabbedFrom: formerOwner
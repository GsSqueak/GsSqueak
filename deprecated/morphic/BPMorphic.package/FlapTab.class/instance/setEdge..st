edge
setEdge: anEdge 
	"Set the edge as indicated, if possible"
	| _gsSqueakTemp_newOrientation _gsSqueakTemp_e |
	_gsSqueakTemp_e := anEdge asSymbol.
	self edgeToAdhereTo = anEdge
		ifTrue: [^ self].
	_gsSqueakTemp_newOrientation := nil.
	self orientation == #vertical
		ifTrue: [(#top == _gsSqueakTemp_e
					or: [#bottom == _gsSqueakTemp_e])
				ifTrue: [_gsSqueakTemp_newOrientation := #horizontal]]
		ifFalse: [(#top == _gsSqueakTemp_e
					or: [#bottom == _gsSqueakTemp_e])
				ifFalse: [_gsSqueakTemp_newOrientation := #vertical]].
	self edgeToAdhereTo: _gsSqueakTemp_e.
	_gsSqueakTemp_newOrientation
		ifNotNil: [self transposeParts].
	referent isInWorld
		ifTrue: [self positionReferent].
	self adjustPositionVisAVisFlap
edge
setEdge: anEdge
	"Set the edge as indicated, if possible"

	| newOrientation e |
	e := anEdge asSymbol.
	self edgeToAdhereTo = anEdge ifTrue: [^ self].
	newOrientation := nil.
	self orientation == #vertical
		ifTrue: [(#top == e or: [#bottom == e]) ifTrue:
					[newOrientation := #horizontal]]
		ifFalse: [(#top == e or: [#bottom == e]) ifFalse:
					[newOrientation := #vertical]].
	self edgeToAdhereTo: e.
	newOrientation ifNotNil: [self transposeParts].
	referent isInWorld ifTrue: [self positionReferent].
	self adjustPositionVisAVisFlap
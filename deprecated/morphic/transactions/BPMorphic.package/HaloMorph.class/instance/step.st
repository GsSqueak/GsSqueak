stepping
step
	| _gsSqueakTemp_newBounds |
	target
		ifNil: [^ self].
	_gsSqueakTemp_newBounds := target isWorldMorph
				ifTrue: [target bounds]
				ifFalse: [self localHaloBoundsFor: target renderedMorph].
	_gsSqueakTemp_newBounds = self bounds
		ifTrue: [^ self].
	_gsSqueakTemp_newBounds extent = self bounds extent
		ifTrue: [^ self position: _gsSqueakTemp_newBounds origin].
	growingOrRotating
		ifFalse: [submorphs size > 1
				ifTrue: [self addHandles]].
	"adjust halo bounds if appropriate"
	self bounds: _gsSqueakTemp_newBounds
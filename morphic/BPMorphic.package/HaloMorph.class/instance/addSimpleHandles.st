private
addSimpleHandles
	target isWorldMorph
		ifTrue: [^ self addHandlesForWorldHalos].
	self removeAllMorphs.
	"remove old handles, if any"
	self bounds: target renderedMorph worldBoundsForHalo.
	"update my size"
	self innerTarget addSimpleHandlesTo: self box: self basicBoxForSimpleHalos
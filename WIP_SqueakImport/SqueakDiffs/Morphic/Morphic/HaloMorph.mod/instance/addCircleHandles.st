private
addCircleHandles
	| box |
	simpleMode := false.
	target isWorldMorph ifTrue: [^ self addHandlesForWorldHalos].

	self removeAllMorphs.  "remove old handles, if any"
	self bounds: target renderedMorph worldBoundsForHalo.  "update my size"
	box := self basicBox.

	target addHandlesTo: self box: box.

	self addName.
	growingOrRotating := false.
	self layoutChanged.
	self changed.

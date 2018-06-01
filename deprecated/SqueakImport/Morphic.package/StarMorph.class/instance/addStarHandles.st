editing
addStarHandles
	"Outer handle must not be blocked so it comes first. 
	The editing routine expects to find the center handle second.
	The side and shape changing handles follow these."
	| center |
	self removeHandles.
	"Check for old stars and correct order of vertices."
	self insureCompatability .
	handles := OrderedCollection new.
	center := vertices average rounded.
	self withCenterOuterHandles; withUpDownLeftRightHandlesAround: 6 center: center.
	self placeHandles.
	self changed.
	
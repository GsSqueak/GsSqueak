primitives-fallback
oldPrimMousePt
	"Primitive. Poll the mouse to find out its position. Return a Point. Fail if
	event-driven tracking is used instead of polling. Optional. See Object
	documentation whatIsAPrimitive."
	self halt.
	^ 0 @ 0
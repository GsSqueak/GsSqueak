editing
newVertex: ix event: evt fromHandle: handle
	"Install a new vertex if there is room."
	(owner insertPointAfter: ix) ifFalse: [^ self "not enough room"].
	super newVertex: ix event: evt fromHandle: handle.
	self verticesAt: ix+1 put: (owner acceptGraphPoint: evt cursorPoint at: ix+1).

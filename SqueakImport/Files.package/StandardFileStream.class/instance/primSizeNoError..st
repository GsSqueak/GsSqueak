primitives
primSizeNoError: id
	"Answer the size of this file. Answer nil if the primitive fails; this indicates that the file handle has become stale."

	self halt.
	^ nil

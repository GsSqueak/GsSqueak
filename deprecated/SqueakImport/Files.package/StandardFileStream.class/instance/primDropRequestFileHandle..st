dnd requests
primDropRequestFileHandle: dropIndex
	"Primitive. Return the (read-only) file handle for some file that was just dropped onto Squeak.
	Fail if dropIndex is out of range or the primitive is not supported."
	self halt.
	^nil
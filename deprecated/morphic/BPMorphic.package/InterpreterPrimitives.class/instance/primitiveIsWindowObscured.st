I/O primitives
primitiveIsWindowObscured
	"Primitive. Answer whether the OS window is currently partially or fully
	obscured. "
	self pop: self methodArgumentCount + 1.
	self pushBool: self ioIsWindowObscured
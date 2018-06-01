compiled methods
primitiveIndexOfMethodHeader: methodHeader
	"Note: We now have 10 bits of primitive index, but they are in two places
	 for temporary backward compatibility.  The time to unpack is negligible,
	 since the derived primitive function pointer is stored in the method cache."
	<api>
	| primBits |
	primBits := (methodHeader >> 1).
	^(primBits bitAnd: 16r1FF) + ((primBits >> 19) bitAnd: 16r200)
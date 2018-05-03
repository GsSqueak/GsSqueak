indexing primitives
primitiveFloatAtPut
	"Provide platform-independent access to 32-bit words comprising
	 a Float.  Map index 1 onto the most significant word and index 2
	 onto the least significant word."

	self subclassResponsibility

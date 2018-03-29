other primitives
primitiveIsBigEnder
	"Answer if running on a big endian machine."
	self pop: 1 thenPushBool: VMBIGENDIAN
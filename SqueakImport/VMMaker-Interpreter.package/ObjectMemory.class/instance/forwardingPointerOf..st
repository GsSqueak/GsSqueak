gc -- compaction
forwardingPointerOf: forwardedObj
	"Answer the pointer to the given forwardedOop's forwarding block."

	^((self longAt: forwardedObj) bitAnd: self allButMarkBitAndTypeMask) << 1
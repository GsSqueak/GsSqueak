testing
isEncrypted
	"Return true if this member is encrypted (this is unsupported)"
	^ (bitFlag bitAnd: 1) ~= 0
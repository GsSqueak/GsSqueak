private
seedWithRandomBytes
	"Initialize the states array with random bytes from the VM. Return true on success, false on failure."

	| randomBytes |
	randomBytes := ByteArray new: MTn * 4.
	(self class gatherEntropyInto: randomBytes) ifFalse: [
		"Primitive not available"
		^false ].
	states := Array new: MTn.
	1 to: MTn do: [ :i | 
		states at: i put: (
			"The below code assumes that MTwordMask is 1 << 30 - 1. It avoids LargeInteger operations on 32-bit platforms. It's equivalent to:
			(randomBytes unsignedLongAt: 1 bigEndian: true) bitAnd: MTwordMask"
			((randomBytes at: i * 4 - 3) bitAnd: 16r3F) * 256 +
				(randomBytes at: i * 4 - 2) * 256 +
				(randomBytes at: i * 4 - 1) * 256 +
				(randomBytes at: i * 4)) ].
	^true
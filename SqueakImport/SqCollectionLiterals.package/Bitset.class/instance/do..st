enumerating
do: aBlock
	"Evaluate aBlock with each integer which has its bit set to 1."

	| byte byteOffset lowBits remainingBits |
	remainingBits := tally.
	lowBits := Integer lowBitPerByteTable.
	1 to: bytes size do: [ :index |
		1 <= remainingBits ifFalse: [ ^self ].
		(byte := bytes at: index) = 0 ifFalse: [
			byteOffset := (index bitShift: 3) - 9. "- 8 - 1 to make it -1 based."
			[
				aBlock value: (lowBits at: byte) + byteOffset. "byteOffset is -1 based, lowBits is 1-based."
				remainingBits := remainingBits - 1.
				"Eliminate the low bit and loop if there're any remaning bits set."
				(byte := byte bitAnd: byte - 1) = 0 ] whileFalse ] ]

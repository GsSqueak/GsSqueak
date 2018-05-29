private
readVarLengthIntFrom: aBinaryStream
	"Read a one to four byte positive integer from the given stream, most significant byte first. Use only the lowest seven bits of each byte. The highest bit of a byte is set for all bytes except the last."

	| n byte |
	n := 0.
	1 to: 4 do: [:ignore |
		byte := aBinaryStream next.
		byte < 128 ifTrue: [
			n = 0
				ifTrue: [^ byte]  "optimization for one-byte lengths"
				ifFalse: [^ (n bitShift: 7) + byte]].
		n := (n bitShift: 7) + (byte bitAnd: 16r7F)].

	self error: 'variable length quantity must not exceed four bytes'.

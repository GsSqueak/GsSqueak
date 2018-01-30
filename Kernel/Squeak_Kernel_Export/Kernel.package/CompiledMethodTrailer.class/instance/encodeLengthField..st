private
encodeLengthField: integer

	| bytes value |
	self assert: (integer > 0).

	value := integer.
	
	bytes := ByteArray streamContents: [:str |
		[ value > 0 ] whileTrue: [
			str nextPut: (value bitAnd: 255).
			value := value >> 8 ]].

	"no more than 4 bytes for length field"
	self assert: (bytes size <=4).

	^ bytes
conversion
decodeByteString: aByteString
	"Convert the given string from UTF-8 using the fast path if converting to Latin-1"

	| outStream lastIndex nextIndex limit byte1 byte2 byte3 byte4 unicode |
	lastIndex := 1.
	(nextIndex := ByteString findFirstInString: aByteString inSet: latin1Map startingAt: lastIndex) = 0
		ifTrue: [ ^aByteString ].
	limit := aByteString size.
	outStream := (String new: limit) writeStream.
	[
		outStream next: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex.
		byte1 := aByteString byteAt: nextIndex.
		(byte1 bitAnd: 16rE0) = 192 ifTrue: [ "two bytes"
			nextIndex < limit ifFalse: [ ^ self errorMalformedInput: aByteString ].
			byte2 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse:[	^self errorMalformedInput: aByteString ].
			unicode := ((byte1 bitAnd: 31) bitShift: 6) + (byte2 bitAnd: 63)].
		(byte1 bitAnd: 16rF0) = 224 ifTrue: [ "three bytes"
			(nextIndex + 2) <= limit ifFalse: [ ^ self errorMalformedInput: aByteString ].
			byte2 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse:[ ^self errorMalformedInput: aByteString ].
			byte3 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte3 bitAnd: 16rC0) = 16r80 ifFalse:[ ^self errorMalformedInput: aByteString ].
			unicode := ((byte1 bitAnd: 15) bitShift: 12) + ((byte2 bitAnd: 63) bitShift: 6)
				+ (byte3 bitAnd: 63)].
		(byte1 bitAnd: 16rF8) = 240 ifTrue: [ "four bytes"
			(nextIndex + 3) <= limit ifFalse: [ ^ self errorMalformedInput: aByteString ].
			byte2 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse:[ ^self errorMalformedInput: aByteString ].
			byte3 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte3 bitAnd: 16rC0) = 16r80 ifFalse:[ ^self errorMalformedInput: aByteString ].
			byte4 := aByteString byteAt: (nextIndex := nextIndex + 1).
			(byte4 bitAnd: 16rC0) = 16r80 ifFalse:[ ^self errorMalformedInput: aByteString ].
			unicode := ((byte1 bitAnd: 16r7) bitShift: 18) +
							((byte2 bitAnd: 63) bitShift: 12) + 
							((byte3 bitAnd: 63) bitShift: 6) +
							(byte4 bitAnd: 63)].
		unicode ifNil: [ ^self errorMalformedInput: aByteString ].
		unicode = 16rFEFF ifFalse: [ "Skip byte order mark"
			outStream nextPut: (Unicode value: unicode) ].
		lastIndex := nextIndex + 1.
		(nextIndex := ByteString findFirstInString: aByteString inSet: latin1Map startingAt: lastIndex) = 0 ] whileFalse.
	^outStream 
		next: aByteString size - lastIndex + 1 putAll: aByteString startingAt: lastIndex;
		contents

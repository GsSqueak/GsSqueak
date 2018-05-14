class initialization
initializeEncodeTable
	"Initialize a table with Squeak Character code as key (without leadingChar) and self Character code as value.
	Character code < 128 don't have to be mapped because they have the same encoding (ASCII)."
	
	decodeTable ifNil: [self initializeDecodeTable].
	self assert: decodeTable size = 256.
	encodeTable := Dictionary new.
	decodeTable keysAndValuesDo: [:key :value |
		(value = -1 or: [value = 16rFFFD]) ifFalse: [
			encodeTable at: value put: key - 1]]
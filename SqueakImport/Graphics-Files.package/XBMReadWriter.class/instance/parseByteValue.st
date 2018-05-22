private
parseByteValue
	"skip over separators and return next bytevalue parsed as a C language number:
		0ddd is an octal digit.
		0xddd is a hex digit.
		ddd is decimal."
	| source mybase |
	stream skipSeparators.
	source := stream upToAnyOf: CharacterSet separators.
	source = '0' ifTrue: [^0]..
	mybase := 10. "Base 10 default"
	source := source asUppercase readStream.
	(source peekFor: $0) ifTrue: [
		mybase := 8. "Octal or Hex, say its Octal unless overridden."
		(source peekFor: $X) ifTrue: [
			mybase := 16. "Ah.  It's Hex."
			]
		].
	^ Integer readFrom: source base: mybase
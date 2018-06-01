system attributes
endianness
	^EndianCache ifNil: [EndianCache := self calcEndianness]

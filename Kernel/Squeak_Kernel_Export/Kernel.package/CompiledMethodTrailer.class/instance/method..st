initialize-release
method: aMethod

	| flagByte index |
	data := size := nil.
	method := aMethod.
	flagByte := method at: method size.

	"trailer kind encoded in 6 high bits of last byte"
	index := flagByte >> 2 + 1.
	kind := self class trailerKinds at: index.

	"decode the trailer bytes"
	self perform: (self class trailerKindDecoders at: index).
	
	"after decoding the trailer, size must be set"
	self assert: size notNil
	

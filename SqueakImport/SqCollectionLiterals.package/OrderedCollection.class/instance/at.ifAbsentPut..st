accessing
at: index ifAbsentPut: block
	"Return value at index, however, if value does not exist (nil or out of bounds) then add block's value at index (growing self if necessary)"

	[ index <= self size ] whileFalse: [ self add: nil ].
	^(self at: index) ifNil: [ self at: index put: block value ]
pragmas
pragmaSequence
	"Parse a sequence of method pragmas."
	[(self matchToken: #<)
		ifFalse: [^ self].
	self pragmaStatement.
	(self matchToken: #>)
		ifFalse: [^ self expected: '>']] repeat
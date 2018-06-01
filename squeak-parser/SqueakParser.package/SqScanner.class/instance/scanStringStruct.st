expression types
scanStringStruct
	| s |
	s := WriteStream
				on: (Array new: 16).
	[tokenType == #rightParenthesis
		or: [tokenType == #doIt]]
		whileFalse: [tokenType == #leftParenthesis
				ifTrue: [self scanToken; scanStringStruct]
				ifFalse: [tokenType == #word
						ifFalse: [^ self error: 'only words and parens allowed']].
			s nextPut: token.
			self scanToken].
	token := s contents
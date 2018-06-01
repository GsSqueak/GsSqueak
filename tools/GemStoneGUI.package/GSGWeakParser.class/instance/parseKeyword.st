parse
parseKeyword 
    | keyword rangeIndices |
    self parseBinary.
	keyword := ''.
	rangeIndices := #().
	[self isKeyword]
		whileTrue: [
			keyword := keyword, currentToken. 
			self rangeType: #keyword.
			"remember where this keyword token is in ranges"
			rangeIndices := rangeIndices copyWith: ranges size.
			self scanNext.
			self parseTerm.
			self parseBinary]
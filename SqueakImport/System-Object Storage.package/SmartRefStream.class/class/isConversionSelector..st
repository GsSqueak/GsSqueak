browsing support
isConversionSelector: aLiteral
	"Let mapClass: be found as sender of our conversion methods"
	^aLiteral isSymbol
	 and: [aLiteral last isDigit
	 and: [self includesSelector: aLiteral]]
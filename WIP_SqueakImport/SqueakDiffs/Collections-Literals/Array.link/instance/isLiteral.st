testing
isLiteral
	
	^self class == Array and: [
		self isLiteralIfContainedBy: IdentitySet new ]

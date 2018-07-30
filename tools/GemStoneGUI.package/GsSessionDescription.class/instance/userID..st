accessing
userID: textOrString
	
	userID := textOrString ifNotNil: [:text | text asString]
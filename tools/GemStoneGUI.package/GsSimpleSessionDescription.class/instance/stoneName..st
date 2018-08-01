accessing
stoneName: textOrString
	
	stoneName := textOrString ifNotNil: [:text | text asString]
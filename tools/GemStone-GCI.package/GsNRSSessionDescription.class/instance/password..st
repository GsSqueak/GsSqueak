accessing
password: textOrString

	password := textOrString ifNotNil: [:text | text asString]
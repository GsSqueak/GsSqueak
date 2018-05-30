access
localName
	^ name ifNotNil: [(name findTokens: FileDirectory pathNameDelimiter asString) last]
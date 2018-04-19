*SqCollectionLiterals-*SqCollectionLiterals-converting
withBlanksCondensed
	"Return a copy of the receiver with leading/trailing blanks removed
	 and consecutive white spaces condensed."

	^String streamContents: [:stream |
		| trimmed lastBlank |
		trimmed := self withBlanksTrimmed.
		lastBlank := false.
		trimmed do: [:c | (c isSeparator and: [lastBlank]) ifFalse: [stream nextPut: c].
			lastBlank := c isSeparator]].

	" ' abc  d   ' withBlanksCondensed"

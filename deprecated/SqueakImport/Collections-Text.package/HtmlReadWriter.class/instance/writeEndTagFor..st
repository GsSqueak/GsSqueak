writing
writeEndTagFor: aTextAttribute

	[aTextAttribute closeHtmlOn: self]
		on: MessageNotUnderstood do: []
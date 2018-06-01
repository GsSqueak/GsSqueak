writing
writeStartTagFor: aTextAttribute

	[aTextAttribute openHtmlOn: self]
		on: MessageNotUnderstood do: [].
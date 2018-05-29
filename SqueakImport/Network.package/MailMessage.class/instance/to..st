accessing
to: aString

	| sanitizedMailAddresses |
	sanitizedMailAddresses := (MailAddressParser addressesIn: aString) asSet asArray.
	^self setField: 'to' toString: (sanitizedMailAddresses joinSeparatedBy: ', ')
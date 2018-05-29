accessing
from: aString
	
	| sanitizedMailAddress |
	sanitizedMailAddress := (MailAddressParser addressesIn: aString) first.
	^self setField: 'from' toString: sanitizedMailAddress
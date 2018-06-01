as yet unclassified
toSystemClipboard: aString

	| result converter |

	aString isAsciiString ifTrue: [^ aString asOctetString]. "optimization"

	result := WriteStream on: (String new: aString size).
	converter := ISO88592TextConverter new.
	aString do: [:each | | r |
		r := converter fromSqueak: each.].
	^ result contents.

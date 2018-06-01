as yet unclassified
toSystemClipboard: aString

	| result |
	aString isOctetString ifTrue: [^ aString asOctetString].

	result := WriteStream on: (String new: aString size).
	aString do: [:each | each value < 256 ifTrue: [result nextPut: each]].
	^ result contents.

as yet unclassified
toSystemClipboard: aString

	| result converter |
	aString isAsciiString ifTrue: [^ aString asOctetString]. "optimization"

	result := WriteStream on: (String new: aString size).
	converter := CP1250TextConverter new.
	aString do: [:each |
		| r |
		r := converter fromSqueak: each.
		r charCode < 255 ifTrue: [
		result nextPut: r squeakToMac]].
	^ result contents.

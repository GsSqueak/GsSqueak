as yet unclassified
fromSystemClipboard: aString

	| result converter |
	result := WriteStream on: (String new: aString size).
	converter := CP1250TextConverter new.
	aString do: [:each |
		result nextPut: (converter toSqueak: each macToSqueak) asCharacter.
	].
	^ result contents.

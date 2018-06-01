defaults
uniqueNameLike: aString

	| try |
	(self named: aString) ifNil: [^ aString].

	1 to: 999999 do:
		[:i | try := aString , i printString.
		(self named: try) ifNil: [^ try]]
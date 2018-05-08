squeak protocol
readFrom: aStream
	| m y |
	aStream skipSeparators.
	m := aStream upToAnyOf: CharacterSet separators.
	aStream skipSeparators.
	y := aStream upToEnd.
	^ self 
		month: m
		year: y asInteger

"Month readFrom: 'July 1998' readStream"
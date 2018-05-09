character classification
isLetterCode: anInteger
	| value |
	value := anInteger // 94 + 1.
	^ 1 <= value and: [value < 84].

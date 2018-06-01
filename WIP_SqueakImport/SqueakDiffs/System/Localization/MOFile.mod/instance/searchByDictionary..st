public
searchByDictionary: aString
	| index |
	index := translations at: aString ifAbsentPut: [nil].
	index ifNil: [^ nil].
	^self translatedString: index
indenting
indentionsIn: aString

	aString
		withIndexDo: 
			[ :eachChar :index | 
			eachChar = $  "space" ifFalse: [ ^(index-1) / self indentionSize ] ].
	^0

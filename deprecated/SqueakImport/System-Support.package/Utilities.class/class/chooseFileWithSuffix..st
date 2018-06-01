summer97 additions
chooseFileWithSuffix: aSuffix
	"Utilities chooseFileWithSuffix: '.gif'"
	| aList aName |
	aList := FileDirectory default fileNamesMatching: '*', aSuffix.
	aList size > 0
		ifTrue:
			[aName := UIManager default chooseFrom: aList values: aList title: 'Choose a file'.
			^ aName]
		ifFalse:
			[self inform: 'Sorry, there are no files
whose names end with "', aSuffix, '".'.
			^ nil]
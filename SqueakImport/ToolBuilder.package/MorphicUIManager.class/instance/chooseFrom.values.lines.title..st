ui requests
chooseFrom: labelList values: valueList lines: linesArray title: aString 
	"Choose an item from the given list. Answer the selected item."
	
	| index |
	index := self chooseFrom: labelList lines: linesArray title: aString.
	^ index = 0
		ifTrue: [ nil ]
		ifFalse: [ valueList at: index ]
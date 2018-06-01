ui requests
chooseFrom: labelList values: valueList lines: linesArray title: aString
	"Choose an item from the given list. Answer the selected item."
	| menu |
	menu := SelectionMenu labels: labelList lines: linesArray selections: valueList.
	^aString isEmpty ifTrue:[menu startUp] ifFalse:[menu startUpWithCaption: aString]
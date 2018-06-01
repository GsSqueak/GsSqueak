ui requests
chooseFrom: aList lines: linesArray title: aString
	"Choose an item from the given list. Answer the index of the selected item."
	| menu |
	menu := PopUpMenu labelArray: aList lines: linesArray.
	^aString isEmpty ifTrue:[menu startUp] ifFalse:[menu startUpWithCaption: aString]
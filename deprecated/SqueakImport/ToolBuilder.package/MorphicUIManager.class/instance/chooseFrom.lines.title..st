ui requests
chooseFrom: aList lines: linesArray title: aString 
	"Choose an item from the given list. Answer the index of the selected item. Cancel value is 0.
	
	There are several (historical) reasons for building a button dialog instead of a list chooser for small lists:
	1) Unfortunately, there is existing code that uses this call to create simple confirmation dialogs with a list of #(yes no cancel).
	2) Unfortunately, there is existing code that uses this call to mimick a drop-down menu with a (compact) pop-up menu."
	
	aList ifEmpty: [^ 0].
	aList size <= 7 ifTrue: [
		| dialog |
		dialog := DialogWindow new
			title: 'Please Choose';
			message: aString;
			filterEnabled: true;
			autoCancel: true; "Like a pop-up menu, click anywhere to dismiss."
			yourself.
		aList doWithIndex: [:ea :index |
			dialog createButton: ea value: index].
		dialog selectedButtonIndex: 1.
		^ dialog getUserResponseAtHand ifNil: [0]].
	
	^ ListChooser chooseFrom: aList title: aString
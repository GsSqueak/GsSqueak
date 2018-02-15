ui requests
chooseFromOrAddTo: aList lines: linesArray title: aString 
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := UIManager default
				chooseFrom: {'new...'} , aList
				lines: linesArray
				title: aString.
	_gsSqueakTemp_index = 0
		ifTrue: [^ nil].
	_gsSqueakTemp_index = 1
		ifTrue: [^ self request: 'Please type new value' initialAnswer: ''].
	^ aList at: _gsSqueakTemp_index - 1
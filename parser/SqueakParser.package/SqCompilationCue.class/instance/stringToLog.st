accessing
stringToLog
	"Answer a string to be logged in a change log.
	Implementation note:
	If the requestor is a TextEditor, preferably take its selection.
	This convoluted code is presumably crafted to avoid broken contents
	(ReadStream on: '123456' from: 3 to: 4) contents -> '1234'
	As long as selectionAsStream is using such construct this might be
	required."
	| itsSelection itsSelectionString |
	^ ((requestor respondsTo: #selection)
			and: [(itsSelection := requestor selection) notNil
					and: [(itsSelectionString := itsSelection asString) isEmptyOrNil not]])
		ifTrue: [itsSelectionString]
		ifFalse: [self sourceStream contents]
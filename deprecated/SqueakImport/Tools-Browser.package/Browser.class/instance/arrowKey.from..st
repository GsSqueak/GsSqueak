multi-window support
arrowKey: aChar from: view
	"Intercept Apple-Digit to select panes"
	| index |
	(aChar isDigit
	 and: [self multiWindowState notNil]) ifTrue:
	 	[index := aChar asciiValue - $0 asciiValue.
		index = 0 ifTrue: [index := 10].
		^index <= self multiWindowState models size
			ifTrue: [self multiWindowState selectWindowIndex: index]
			ifFalse: [self changed: #flash]].
	^super arrowKey: aChar from: view

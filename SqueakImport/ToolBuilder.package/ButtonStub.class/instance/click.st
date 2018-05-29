simulating
click
	| action |
	action := spec action.
	action isSymbol
		ifTrue: [self model perform: action]
		ifFalse: [action value]
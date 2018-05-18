accessing - columns
contentsAtColumn: index
	"Split string contents at <tab> character."
	
	| column scanner cell |
	column := 0.
	scanner := ReadStream on: contents asString.
	[(cell := scanner upTo: Character tab) notEmpty]
		whileTrue: [column := column + 1. column = index ifTrue: [^ cell]].
	^ ''
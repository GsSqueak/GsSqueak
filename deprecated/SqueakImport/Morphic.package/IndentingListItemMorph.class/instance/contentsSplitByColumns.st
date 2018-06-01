accessing - columns
contentsSplitByColumns
	"Split string contents at <tab> character."
	
	| result scanner cell |
	result := OrderedCollection new.
	scanner := ReadStream on: contents asString.
	[(cell := scanner upTo: Character tab) notEmpty]
		whileTrue: [result add: cell].
	^ result
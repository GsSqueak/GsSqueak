editing keys
makeCapitalized: aKeyboardEvent
	"Force the current selection to uppercase."

	| prev |
	prev := $-.  "not a letter"
	self replaceSelectionWith: 
		(self selection string collect:
			[:c | prev := prev isLetter ifTrue: [c asLowercase] ifFalse: [c asUppercase]]).
	^ true
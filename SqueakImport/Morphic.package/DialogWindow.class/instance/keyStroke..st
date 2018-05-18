events
keyStroke: evt
	| char |
	self stopAutoTrigger.
	char := evt keyCharacter.

	char = Character escape ifTrue: [ ^ self cancelDialog ].
	(char = Character cr or: [char = Character enter]) ifTrue: [ ^ self closeDialog ].

	((char = Character arrowLeft or: [char = Character arrowUp])
		or: [ evt shiftPressed and: [ char = Character tab ] ])
			ifTrue: [ ^ self selectPreviousButton ].
	((char = Character arrowRight or: [char = Character arrowDown])
		or: [ char = Character tab ])
			ifTrue: [ ^ self selectNextButton ].
	
	self filterEnabled ifTrue: [
		char = Character backspace ifTrue: [self filter: (self filter ifEmpty: [''] ifNotEmpty: [:f | f allButLast])].
		(char isAlphaNumeric or: [char = Character space])
			ifTrue: [self filter: self filter, char asString]].
	
	keyMap
		at: char asLowercase
		ifPresent: [ : foundButton | foundButton performAction ]
		ifAbsent: [ "do nothing" ].
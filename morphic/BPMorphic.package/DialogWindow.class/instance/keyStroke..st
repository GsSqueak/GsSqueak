events
keyStroke: evt 
	| _gsSqueakTemp_char |
	self stopAutoTrigger.
	_gsSqueakTemp_char := evt keyCharacter.
	_gsSqueakTemp_char = Character escape
		ifTrue: [^ self cancelDialog].
	(_gsSqueakTemp_char = Character cr
			or: [_gsSqueakTemp_char = Character enter])
		ifTrue: [^ self closeDialog].
	((_gsSqueakTemp_char = Character arrowLeft
				or: [_gsSqueakTemp_char = Character arrowUp])
			or: [evt shiftPressed
					and: [_gsSqueakTemp_char = Character tab]])
		ifTrue: [^ self selectPreviousButton].
	((_gsSqueakTemp_char = Character arrowRight
				or: [_gsSqueakTemp_char = Character arrowDown])
			or: [_gsSqueakTemp_char = Character tab])
		ifTrue: [^ self selectNextButton].
	self filterEnabled
		ifTrue: [_gsSqueakTemp_char = Character backspace
				ifTrue: [self
						filter: (self filter
								ifEmpty: ['']
								ifNotEmpty: [:f | f allButLast])].
			(_gsSqueakTemp_char isAlphaNumeric
					or: [_gsSqueakTemp_char = Character space])
				ifTrue: [self filter: self filter , _gsSqueakTemp_char asString]].
	keyMap
		at: _gsSqueakTemp_char asLowercase
		ifPresent: [:foundButton | foundButton performAction]
		ifAbsent: ["do nothing"
			]
editing keys
makeCapitalized: aKeyboardEvent 
	"Force the current selection to uppercase."
	| _gsSqueakTemp_prev |
	_gsSqueakTemp_prev := $-.
	"not a letter"
	self
		replaceSelectionWith: (self selection string
				collect: [:c | _gsSqueakTemp_prev := _gsSqueakTemp_prev isLetter
								ifTrue: [c asLowercase]
								ifFalse: [c asUppercase]]).
	^ true
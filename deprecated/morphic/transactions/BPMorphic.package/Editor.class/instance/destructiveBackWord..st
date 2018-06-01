typing/selecting keys
destructiveBackWord: aKeyboardEvent 
	"If the selection is not a caret, delete it and leave it in the backspace
	buffer. Else if there is typeahead, delete it.
	Else, delete the word before the caret."
	| _gsSqueakTemp_startIndex |
	self hasCaret
		ifTrue: ["a caret, delete at least one character"
			_gsSqueakTemp_startIndex := 1 max: self markIndex - 1.
			[_gsSqueakTemp_startIndex > 1
				and: [(self string at: _gsSqueakTemp_startIndex - 1) tokenish]]
				whileTrue: [_gsSqueakTemp_startIndex := _gsSqueakTemp_startIndex - 1]]
		ifFalse: ["a non-caret, just delete it"
			_gsSqueakTemp_startIndex := self markIndex].
	self backTo: _gsSqueakTemp_startIndex.
	^ false
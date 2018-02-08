printing
printKeyStringOn: aStream 
	"Print a readable string representing the receiver on a given stream"
	| _gsSqueakTemp_kc _gsSqueakTemp_inBrackets _gsSqueakTemp_firstBracket _gsSqueakTemp_keyString |
	_gsSqueakTemp_kc := self keyCharacter.
	_gsSqueakTemp_inBrackets := false.
	_gsSqueakTemp_firstBracket := [_gsSqueakTemp_inBrackets
				ifFalse: [aStream nextPut: $<.
					_gsSqueakTemp_inBrackets := true]].
	self controlKeyPressed
		ifTrue: [_gsSqueakTemp_firstBracket value.
			aStream nextPutAll: 'Ctrl-'].
	self commandKeyPressed
		ifTrue: [_gsSqueakTemp_firstBracket value.
			aStream nextPutAll: 'Cmd-'].
	(buttons anyMask: 32)
		ifTrue: [_gsSqueakTemp_firstBracket value.
			aStream nextPutAll: 'Opt-'].
	(self shiftPressed
			and: [(keyValue between: 1 and: 31)
					or: [self keyCharacter = Character delete]])
		ifTrue: [_gsSqueakTemp_firstBracket value.
			aStream nextPutAll: 'Shift-'].
	_gsSqueakTemp_keyString := _gsSqueakTemp_kc caseOf: {
				[Character space] -> ['space'].
				[Character tab] -> ['tab'].
				[Character cr] -> ['cr'].
				[Character lf] -> ['lf'].
				[Character enter] -> ['enter'].
				[Character backspace] -> ['backspace'].
				[Character delete] -> ['delete'].
				[Character escape] -> ['escape'].
				[Character arrowDown] -> ['down'].
				[Character arrowUp] -> ['up'].
				[Character arrowLeft] -> ['left'].
				[Character arrowRight] -> ['right'].
				[Character end] -> ['end'].
				[Character home] -> ['home'].
				[Character pageDown] -> ['pageDown'].
				[Character pageUp] -> ['pageUp'].
				[Character euro] -> ['euro'].
				[Character insert] -> ['insert']}
				 otherwise: [String with: _gsSqueakTemp_kc].
	_gsSqueakTemp_keyString size > 1
		ifTrue: [_gsSqueakTemp_firstBracket value].
	aStream nextPutAll: _gsSqueakTemp_keyString.
	_gsSqueakTemp_inBrackets
		ifTrue: [aStream nextPut: $>]
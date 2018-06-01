editing keys
enclose: aKeyboardEvent 
	"Insert or remove bracket characters around the current selection."
	| _gsSqueakTemp_character _gsSqueakTemp_left _gsSqueakTemp_right _gsSqueakTemp_startIndex _gsSqueakTemp_stopIndex _gsSqueakTemp_oldSelection _gsSqueakTemp_which _gsSqueakTemp_t |
	_gsSqueakTemp_character := aKeyboardEvent shiftPressed
				ifTrue: ['{}|"<>'
						at: ('[]\'',.' indexOf: aKeyboardEvent keyCharacter)
						ifAbsent: [aKeyboardEvent keyCharacter]]
				ifFalse: [aKeyboardEvent keyCharacter].
	self closeTypeIn.
	_gsSqueakTemp_startIndex := self startIndex.
	_gsSqueakTemp_stopIndex := self stopIndex.
	_gsSqueakTemp_oldSelection := self selection.
	_gsSqueakTemp_which := '([<{|"''9'
				indexOf: _gsSqueakTemp_character
				ifAbsent: [^ false].
	"Allow Control key in lieu of Alt+Shift for (, {, and double-quote."
	_gsSqueakTemp_left := ((Preferences cmdKeysInText
					and: [aKeyboardEvent controlKeyPressed])
				ifTrue: ['({<{|""(']
				ifFalse: ['([<{|"''('])
				at: _gsSqueakTemp_which.
	_gsSqueakTemp_right := ((Preferences cmdKeysInText
					and: [aKeyboardEvent controlKeyPressed])
				ifTrue: [')}>}|"")']
				ifFalse: [')]>}|"'')'])
				at: _gsSqueakTemp_which.
	_gsSqueakTemp_t := self text.
	((_gsSqueakTemp_startIndex > 1
				and: [_gsSqueakTemp_stopIndex <= _gsSqueakTemp_t size])
			and: [(_gsSqueakTemp_t at: _gsSqueakTemp_startIndex - 1)
						= _gsSqueakTemp_left
					and: [(_gsSqueakTemp_t at: _gsSqueakTemp_stopIndex)
							= _gsSqueakTemp_right]])
		ifTrue: ["already enclosed; strip off brackets"
			self selectFrom: _gsSqueakTemp_startIndex - 1 to: _gsSqueakTemp_stopIndex.
			self replaceSelectionWith: _gsSqueakTemp_oldSelection]
		ifFalse: ["not enclosed; enclose by matching brackets"
			self
				replaceSelectionWith: (Text string: (String with: _gsSqueakTemp_left)
							, _gsSqueakTemp_oldSelection string
							, (String with: _gsSqueakTemp_right) attributes: emphasisHere).
			self selectFrom: _gsSqueakTemp_startIndex + 1 to: _gsSqueakTemp_stopIndex].
	^ true
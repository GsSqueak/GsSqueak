keyboard
keyboard
	"Answer the next character from the keyboard."
	| _gsSqueakTemp_firstCharacter _gsSqueakTemp_secondCharactor _gsSqueakTemp_stream _gsSqueakTemp_multiCharacter _gsSqueakTemp_converter |
	_gsSqueakTemp_firstCharacter := self characterForKeycode: self primKbdNext.
	_gsSqueakTemp_secondCharactor := self peekKeyboard.
	_gsSqueakTemp_secondCharactor isNil
		ifTrue: [^ _gsSqueakTemp_firstCharacter].
	_gsSqueakTemp_converter := TextConverter defaultSystemConverter.
	_gsSqueakTemp_converter isNil
		ifTrue: [^ _gsSqueakTemp_firstCharacter].
	_gsSqueakTemp_stream := ReadStream
				on: (String with: _gsSqueakTemp_firstCharacter with: _gsSqueakTemp_secondCharactor).
	_gsSqueakTemp_multiCharacter := _gsSqueakTemp_converter nextFromStream: _gsSqueakTemp_stream.
	_gsSqueakTemp_multiCharacter isOctetCharacter
		ifTrue: [^ _gsSqueakTemp_multiCharacter].
	self primKbdNext.
	^ _gsSqueakTemp_multiCharacter
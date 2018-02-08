instance creation
readFromObsolete: aStream 
	"Read one of those old and now obsolete events from the stream"
	| _gsSqueakTemp_type _gsSqueakTemp_x _gsSqueakTemp_y _gsSqueakTemp_buttons _gsSqueakTemp_keyValue _gsSqueakTemp_typeString |
	_gsSqueakTemp_typeString := String
				streamContents: [:s | | c | [(c := aStream next) isLetter]
						whileTrue: [s nextPut: c]].
	_gsSqueakTemp_typeString = 'mouseMove'
		ifTrue: [_gsSqueakTemp_type := #mouseMove
			"fast treatment of common case"]
		ifFalse: [_gsSqueakTemp_type := _gsSqueakTemp_typeString asSymbol].
	_gsSqueakTemp_x := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_y := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_buttons := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_keyValue := Integer readFrom: aStream.
	_gsSqueakTemp_typeString = 'mouseMove'
		ifTrue: [^ MouseMoveEvent new
				setType: #mouseMove
				startPoint: _gsSqueakTemp_x @ _gsSqueakTemp_y
				endPoint: _gsSqueakTemp_x @ _gsSqueakTemp_y
				trail: #()
				buttons: _gsSqueakTemp_buttons
				hand: nil
				stamp: nil].
	_gsSqueakTemp_typeString = 'mouseDown' | (_gsSqueakTemp_typeString = 'mouseUp')
		ifTrue: [^ MouseButtonEvent new
				setType: _gsSqueakTemp_type
				position: _gsSqueakTemp_x @ _gsSqueakTemp_y
				which: 0
				buttons: _gsSqueakTemp_buttons
				hand: nil
				stamp: nil].
	_gsSqueakTemp_typeString = 'keystroke' | (_gsSqueakTemp_typeString = 'keyDown') | (_gsSqueakTemp_typeString = 'keyUp')
		ifTrue: [^ KeyboardEvent new
				setType: _gsSqueakTemp_type
				buttons: _gsSqueakTemp_buttons
				position: _gsSqueakTemp_x @ _gsSqueakTemp_y
				keyValue: _gsSqueakTemp_keyValue
				hand: nil
				stamp: nil].
	^ nil
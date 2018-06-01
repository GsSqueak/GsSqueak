typing support
dispatchOnKeyboardEvent: aKeyboardEvent 
	"Carry out the action associated with this character, if any. Type-ahead
	is passed so some routines can flush or use it."
	| _gsSqueakTemp_honorCommandKeys _gsSqueakTemp_typedChar |
	_gsSqueakTemp_typedChar := aKeyboardEvent keyCharacter.
	"Handle one-line input fields."
	(_gsSqueakTemp_typedChar == Character cr
			and: [morph acceptOnCR])
		ifTrue: [^ true].
	"Clear highlight for last opened parenthesis."
	self clearParens.
	"Handle line breaks and auto indent."
	_gsSqueakTemp_typedChar == Character cr
		ifTrue: [aKeyboardEvent controlKeyPressed
				ifTrue: [^ self normalCharacter: aKeyboardEvent].
			aKeyboardEvent shiftPressed
				ifTrue: [^ self lf: aKeyboardEvent].
			aKeyboardEvent commandKeyPressed
				ifTrue: [^ self crlf: aKeyboardEvent].
			^ self crWithIndent: aKeyboardEvent].
	"Handle indent/outdent with selected text block."
	_gsSqueakTemp_typedChar == Character tab
		ifTrue: [aKeyboardEvent shiftPressed
				ifTrue: [self outdent: aKeyboardEvent.
					^ true]
				ifFalse: [self hasMultipleLinesSelected
						ifTrue: [self indent: aKeyboardEvent.
							^ true]]].
	_gsSqueakTemp_honorCommandKeys := Preferences cmdKeysInText.
	(_gsSqueakTemp_honorCommandKeys
			and: [_gsSqueakTemp_typedChar == Character enter])
		ifTrue: [^ self dispatchOnEnterWith: aKeyboardEvent].
	"Special keys overwrite crtl+key combinations - at least on Windows.
	To resolve this
	conflict, assume that keys other than cursor keys aren't used
	together with Crtl."
	((self class specialShiftCmdKeys includes: aKeyboardEvent keyValue)
			and: [aKeyboardEvent keyValue < 27])
		ifTrue: [^ aKeyboardEvent controlKeyPressed
				ifTrue: [self
						perform: (self class shiftCmdActions at: aKeyboardEvent keyValue + 1)
						with: aKeyboardEvent]
				ifFalse: [self
						perform: (self class cmdActions at: aKeyboardEvent keyValue + 1)
						with: aKeyboardEvent]].
	"backspace, and escape keys (ascii 8 and 27) are command keys"
	((_gsSqueakTemp_honorCommandKeys
				and: [aKeyboardEvent commandKeyPressed])
			or: [self class specialShiftCmdKeys includes: aKeyboardEvent keyValue])
		ifTrue: [^ aKeyboardEvent shiftPressed
				ifTrue: [self
						perform: (self class shiftCmdActions at: aKeyboardEvent keyValue + 1)
						with: aKeyboardEvent]
				ifFalse: [self
						perform: (self class cmdActions at: aKeyboardEvent keyValue + 1)
						with: aKeyboardEvent]].
	"the control key can be used to invoke shift-cmd shortcuts"
	(_gsSqueakTemp_honorCommandKeys
			and: [aKeyboardEvent controlKeyPressed])
		ifTrue: [^ self
				perform: (self class shiftCmdActions at: aKeyboardEvent keyValue + 1)
				with: aKeyboardEvent].
	"Enclose selection with brackets etc."
	((self class encloseSelection
				and: [self hasSelection])
			and: [self enclose: aKeyboardEvent])
		ifTrue: [^ true].
	"Automatically enclose paired characters such as brackets."
	(self class autoEnclose
			and: [self autoEncloseFor: _gsSqueakTemp_typedChar])
		ifTrue: [^ true].
	self normalCharacter: aKeyboardEvent.
	^ false
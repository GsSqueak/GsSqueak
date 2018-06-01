typing support
dispatchOnKeyboardEvent: aKeyboardEvent 
	"Carry out the action associated with this character, if any. Type-ahead is passed so some routines can flush or use it."
	
	| honorCommandKeys typedChar |
	typedChar := aKeyboardEvent keyCharacter.
	
	"Handle one-line input fields."
	(typedChar == Character cr and: [morph acceptOnCR])
		ifTrue: [^ true].
	
	"Clear highlight for last opened parenthesis."
	self clearParens.
	
	"Handle line breaks and auto indent."
	typedChar == Character cr ifTrue: [
		aKeyboardEvent controlKeyPressed
			ifTrue: [^ self normalCharacter: aKeyboardEvent].
		aKeyboardEvent shiftPressed
			ifTrue: [^ self lf: aKeyboardEvent].
		aKeyboardEvent commandKeyPressed
			ifTrue: [^ self crlf: aKeyboardEvent].
		^ self crWithIndent: aKeyboardEvent].

	"Handle indent/outdent with selected text block."
	typedChar == Character tab ifTrue: [
		aKeyboardEvent shiftPressed
			ifTrue: [self outdent: aKeyboardEvent. ^ true]
			ifFalse: [self hasMultipleLinesSelected
				ifTrue: [self indent: aKeyboardEvent. ^ true]]].

	honorCommandKeys := Preferences cmdKeysInText.

	(honorCommandKeys and: [typedChar == Character enter])
		ifTrue: [^ self dispatchOnEnterWith: aKeyboardEvent].
	
	"Special keys overwrite crtl+key combinations - at least on Windows. To resolve this
	conflict, assume that keys other than cursor keys aren't used together with Crtl."
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
	((honorCommandKeys and: [aKeyboardEvent commandKeyPressed])
		or: [self class specialShiftCmdKeys includes: aKeyboardEvent keyValue])
			ifTrue: [ ^ aKeyboardEvent shiftPressed
				ifTrue: [self
							perform: (self class shiftCmdActions at: aKeyboardEvent keyValue + 1)
							with: aKeyboardEvent]
				ifFalse: [self
							perform: (self class cmdActions at: aKeyboardEvent keyValue + 1)
							with: aKeyboardEvent]].

	"the control key can be used to invoke shift-cmd shortcuts"
	(honorCommandKeys and: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [^ self
					perform: (self class shiftCmdActions at: aKeyboardEvent keyValue + 1)
					with: aKeyboardEvent].

	"Enclose selection with brackets etc."
	((self class encloseSelection and: [self hasSelection]) and: [self enclose: aKeyboardEvent])
		ifTrue: [^ true].

	"Automatically enclose paired characters such as brackets."
	(self class autoEnclose and: [self autoEncloseFor: typedChar])
		ifTrue: [^ true].
		
	"Even if no enclosing feature was used, highlight the matching bracket when closing one."
	(')]}' includes: typedChar)
		ifTrue: [self blinkPrevParen: typedChar].
					
	self normalCharacter: aKeyboardEvent.
	^ false
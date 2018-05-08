keyboard
keyboard
	"Answer the next character from the keyboard."

	| firstCharacter secondCharactor stream multiCharacter converter |
	firstCharacter := self characterForKeycode: self primKbdNext.
	secondCharactor := self peekKeyboard.
	secondCharactor isNil
		ifTrue: [^ firstCharacter].
	converter := TextConverter defaultSystemConverter.
	converter isNil
		ifTrue: [^ firstCharacter].
	stream := ReadStream
				on: (String with: firstCharacter with: secondCharactor).
	multiCharacter := converter nextFromStream: stream.
	multiCharacter isOctetCharacter
		ifTrue: [^ multiCharacter].
	self primKbdNext.
	^ multiCharacter

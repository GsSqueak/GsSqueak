keyboard
peekKeyboard
	"Answer the next character in the keyboard buffer without removing it, or nil if it is empty."

	| char |
	self fetchMoreEvents.
	keyboardBuffer isEmpty ifFalse: [^ self characterForKeycode: keyboardBuffer peek].
	char := nil.
	self eventQueue ifNotNil: [:queue |
		queue nextOrNilSuchThat:  "NOTE: must not return out of this block, so loop to end"
			[:buf | (self isKbdEvent: buf) ifTrue: [char ifNil: [char := buf at: 3]].
			false  "NOTE: block value must be false so Queue won't advance"]].
	^ self characterForKeycode: char
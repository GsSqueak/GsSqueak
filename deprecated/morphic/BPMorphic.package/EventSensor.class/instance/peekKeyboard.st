keyboard
peekKeyboard
	"Answer the next character in the keyboard buffer without removing
	it, or nil if it is empty."
	| _gsSqueakTemp_char |
	self fetchMoreEvents.
	keyboardBuffer isEmpty
		ifFalse: [^ self characterForKeycode: keyboardBuffer peek].
	_gsSqueakTemp_char := nil.
	self eventQueue
		ifNotNil: [:queue | queue
				nextOrNilSuchThat: [:buf | 
					"NOTE: must not return out of this block, so loop to
					end "
					(self isKbdEvent: buf)
						ifTrue: [_gsSqueakTemp_char
								ifNil: [_gsSqueakTemp_char := buf at: 3]].
					false
					"NOTE: block value must be false so Queue won't
					advance "]].
	^ self characterForKeycode: _gsSqueakTemp_char
event filtering
filterEvent: aKeyboardEvent for: morphOrNil
	"See #initialize. This filter should be installed as keyboard event filter during the capture phase."

	aKeyboardEvent isKeystroke
		ifFalse: [^ aKeyboardEvent].

	^ aKeyboardEvent
		wasIgnored: (self scrollByKeyboard: aKeyboardEvent);
		yourself
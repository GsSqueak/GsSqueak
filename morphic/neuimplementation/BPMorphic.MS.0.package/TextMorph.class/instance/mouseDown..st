event handling
mouseDown: evt 
	"Make this TextMorph be the keyboard input focus, if it isn't 
	already, and repond to the text selection gesture."
	evt yellowButtonPressed
		ifTrue: ["First check for option (menu) click"
			^ self yellowButtonActivity: evt shiftPressed].
	"Show the caret immediately on mouse down to give user feedback."
	self resetBlinkCursor.
	"If focus does not follow the mouse cursor and we click below
	everything, just grab the focus to not destroy the selection."
	((self hasKeyboardFocus: evt hand) not
			and: [(self bounds containsPoint: evt position) not])
		ifTrue: [evt hand newKeyboardFocus: self]
		ifFalse: [evt hand newKeyboardFocus: self.
			self
				handleInteraction: [editor mouseDown: evt]
				fromEvent: evt]
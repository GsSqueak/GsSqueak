event handling
keyStroke: evt 
	"Handle a keystroke event."
	self resetBlinkCursor.
	"don't blink during type-in"
	ToolSet
		codeCompletionAround: [evt keyValue = 13
				ifTrue: ["CR - check for special action"
					self crAction
						ifNotNil: [:action | 
							"Note: Code below assumes that this was some
							input field reacting on CR. Break the keyboard
							focus so that the receiver can be safely
							deleted. "
							evt hand newKeyboardFocus: nil.
							^ action valueWithEnoughArguments: {evt}]].
			self
				handleInteraction: [self editor keyStroke: evt]
				fromEvent: evt.
			"self updateFromParagraph."
			super keyStroke: evt
			"sends to keyStroke event handler, if any"]
		textMorph: self
		keyStroke: evt
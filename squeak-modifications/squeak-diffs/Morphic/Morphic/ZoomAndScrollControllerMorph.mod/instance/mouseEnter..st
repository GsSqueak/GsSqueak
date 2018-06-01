event handling
mouseEnter: evt

	evt hand newKeyboardFocus: self.
	currentKeyDown := Set new.
	hasFocus := true.


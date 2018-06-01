events
deactivate: evt 

	| newKeyboardFocus newMouseFocus |
	self selectItem: nil event: evt.
	newKeyboardFocus := self oldKeyboardFocus.
	newMouseFocus := self oldMouseFocus.
	oldKeyboardFocus := oldMouseFocus := nil.
	evt hand
		newKeyboardFocus: newKeyboardFocus;
		newMouseFocus: newMouseFocus
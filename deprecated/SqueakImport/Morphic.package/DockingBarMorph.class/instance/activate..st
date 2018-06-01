events
activate: evt 
	"Receiver should be activated; e.g., so that control passes  
	correctly."
	
	oldKeyboardFocus := evt hand keyboardFocus.
	self oldMouseFocus: evt hand mouseFocus.
	evt hand 
		newKeyboardFocus: self;
		newMouseFocus: self.
	self ensureSelectedItem: evt
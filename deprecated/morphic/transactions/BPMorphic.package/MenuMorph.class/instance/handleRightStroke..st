keystroke helpers
handleRightStroke: evt 
	29 = evt keyValue
		ifFalse: [^ false].
	self stepIntoSubmenu: evt.
	^ true
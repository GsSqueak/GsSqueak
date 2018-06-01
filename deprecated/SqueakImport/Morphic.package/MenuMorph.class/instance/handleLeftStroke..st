keystroke helpers
handleLeftStroke: evt

	28 = evt keyValue ifFalse: [ ^false ].
	self stepIntoSubmenu: evt.
	^true
keystroke helpers
handleLeftStroke: evt

	28 = evt keyValue ifFalse: [ ^false ].
	(self stepIntoSubmenu: evt) ifFalse: [ 
		self deactivate: evt.
		activatorDockingBar moveSelectionDown: -1 event: evt ].
	^true
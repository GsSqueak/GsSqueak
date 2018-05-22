keystroke helpers
handleCommandKeyPress: evt

	(evt commandKeyPressed and: [
		self commandKeyHandler notNil ]) ifTrue: [
			self commandKeyHandler commandKeyTypedIntoMenu: evt.
			self deleteIfPopUp: evt.
			^true ].
	^false
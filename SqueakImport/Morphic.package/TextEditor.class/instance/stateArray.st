initialize-release
stateArray
	^ {ChangeText.
		FindText.
		history ifNil: [TextEditorCommandHistory new]. "Convert old instances"
		self selectionInterval.
		self startOfTyping.
		emphasisHere}
initialize-release
stateArray
	^ {ChangeText. FindText. history
		ifNil: [TextEditorCommandHistory new]. self selectionInterval. self startOfTyping. emphasisHere}"Convert old instances"
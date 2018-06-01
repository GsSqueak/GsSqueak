command execution
undoCommand
	"Perform the 'undo' operation"

	undoTarget ifNotNil: [undoTarget perform: undoSelector withArguments: undoArguments]
command execution
redoCommand
	"Perform the 'redo' operation"

	redoTarget ifNotNil: [redoTarget perform: redoSelector withArguments: redoArguments]
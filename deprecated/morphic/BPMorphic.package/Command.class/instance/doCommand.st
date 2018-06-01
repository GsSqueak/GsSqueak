command execution
doCommand
	"Do the command represented by the receiver. Not actually called by
	active current code, but reachable by the not-yet-unsealed
	promoteToCurrent: action."
	redoTarget
		ifNotNil: [redoTarget perform: redoSelector withArguments: redoArguments]
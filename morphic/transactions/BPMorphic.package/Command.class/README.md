An object representing an undoable command to be done in the environment.

Structure:
	phase			indicates whether the cmd is current in undone or redone mode
 	cmdWording		The wording of the command (used in arming the "undo"/"redo" menu items
 	parameters		an IdentityDictionary /NOT USED/
	undoTarget		Receiver, selector and arguments to accomplish undo
	undoSelector
	undoArguments
	redoTarget		Receiver, selector and arguments to accomplish redo
	redoSelector
	redoArguments

To use this, for any command you wish to use, you
	*	Create an instance of Command, as follows...
			cmd := Command new cmdWording: 'resizing'.
	*	Give the the command undo state and redo state, as follows...
			cmd undoTarget: target selector: #extent: argument: oldExtent.
			cmd redoTarget: target selector: #extent: argument: newExtent.
	*	Send a message of the form
			Command rememberCommand: cmd

LastCommand is the last command that was actually done or undone.

CommandHistory, applicable only when infiniteUndo is set, holds a 'tape' of the complete history of commands, as far back as it's possible to go.

CommandExcursions, also applicable only in the infiniteUndo case, and rather at the fringe even then, holds segments of former CommandHistory that have been lopped off because of variant paths taken.
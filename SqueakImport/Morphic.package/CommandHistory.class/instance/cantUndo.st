called by programmer
cantUndo
	"Called by client to indicate that the prior undoable command is no longer undoable"

	lastCommand := nil.
	history := OrderedCollection new.
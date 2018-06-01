initialization
undoTarget: target selector: selector arguments: arguments
	"Give target morph a chance to refine its undo operation"

	target refineUndoTarget: target selector: selector arguments: arguments in:
		[:rTarget :rSelector :rArguments |
		undoTarget := rTarget.
		undoSelector := rSelector.
		undoArguments := rArguments]
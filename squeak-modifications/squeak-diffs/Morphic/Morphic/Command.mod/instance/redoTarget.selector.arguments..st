initialization
redoTarget: target selector: selector arguments: arguments
	"Give target morph a chance to refine its undo operation"

	target refineRedoTarget: target selector: selector arguments: arguments in:
		[:rTarget :rSelector :rArguments |
		redoTarget := rTarget.
		redoSelector := rSelector.
		redoArguments := rArguments]
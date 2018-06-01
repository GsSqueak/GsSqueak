other
wantsRecompilationProgressReported
	"Report progress for Player itself, but not for automatically-created
	subclasses like Player1, Player2"
	^ self == Player
		or: [(self class name beginsWith: 'Player') not]
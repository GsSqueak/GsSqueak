other
wantsChangeSetLogging
	"Log changes for Player itself, but not for automatically-created
	subclasses like Player1, Player2, but *do* log it for uniclasses that
	have been manually renamed."
	^ (self == Player
			or: [(self name beginsWith: 'Player') not])
		or: [Preferences universalTiles]
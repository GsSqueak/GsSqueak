browse
browseUncommentedMethodsWithInitials: targetInitials
	"Browse uncommented methods whose initials (in the time-stamp, as logged to disk) match the given initials.  Present them in chronological order.  CAUTION: It will take several seconds for this to complete."
	"Time millisecondsToRun: [SystemNavigation default browseUncommentedMethodsWithInitials: 'jm']"

	self
		browseMessageList: [ self allUncommentedMethodsWithInitials: targetInitials ] 
		name: 'Uncommented methods with initials ', targetInitials
		autoSelect: nil
utilities
askForDefault
	"self askForDefault"
	
	self anyPortNumFromUser ifNotNil: [:num |
		DefaultPortNumber := num].
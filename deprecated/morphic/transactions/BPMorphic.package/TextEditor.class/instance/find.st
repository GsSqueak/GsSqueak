menu messages
find
	"Prompt the user for a string to search for, and search the receiver
	from the current selection onward for it. 1/26/96 sw"
	self setSearchFromSelectionOrHistory.
	(UIManager default request: 'Find what to select? ' initialAnswer: FindText)
		ifEmpty: [^ self]
		ifNotEmpty: [:reply | 
			FindText := reply.
			self findAgainNow]
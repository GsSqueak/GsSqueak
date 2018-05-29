macpal
codeStrippedOut: messageString
	"When a method is stripped out for external release, it is replaced by a method that calls this"

	self halt: 'Code stripped out -- ', messageString, '-- do not proceed.'

*EnvironmentsEnv7-emulating
associationAt: aSymbol ifAbsent: aBlock 
	"Senders of this should probably be using #bindingOf:"
	self flag: #review.
	^ declarations associationAt: aSymbol ifAbsent: aBlock

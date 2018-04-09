emulating
associationAt: aSymbol 
	"Senders of this should probably be using #bindingOf:"
	self flag: #review.
	^ declarations associationAt: aSymbol
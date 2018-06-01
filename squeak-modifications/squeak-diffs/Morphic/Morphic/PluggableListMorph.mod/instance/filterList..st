filtering
filterList: aString
	"Manually set the list filter."

	lastKeystrokes := aString.
	self filterList.
	self updateList.
	self changeModelSelection: (list ifEmpty: [0] ifNotEmpty: [self modelIndexFor: 1]).
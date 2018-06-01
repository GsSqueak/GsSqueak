menus
copySelectionToClipboard
	"Copy my selected item to the clipboard as a string"
	self selection
		ifNil: [self flash]
		ifNotNil: [Clipboard clipboardText: self selection asString]
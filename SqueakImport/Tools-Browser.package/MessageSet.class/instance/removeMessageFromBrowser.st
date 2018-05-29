message functions
removeMessageFromBrowser
	"Remove the selected message from the browser."

	self hasMessageSelected ifFalse: [^ self].
	self deleteFromMessageList: self selection.
	self reformulateList.
	self adjustWindowTitleAfterFiltering

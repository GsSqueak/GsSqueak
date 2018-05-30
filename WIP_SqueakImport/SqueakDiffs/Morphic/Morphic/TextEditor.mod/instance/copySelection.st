menu messages
copySelection
	"Copy the current selection and store it in the paste buffer, unless a caret."

	self lineSelectAndEmptyCheck: [^ self].
	self clipboardTextPut: self selection.
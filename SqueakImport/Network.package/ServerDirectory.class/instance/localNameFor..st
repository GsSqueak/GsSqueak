file directory
localNameFor: fullName
	"Return the local part the given name."

	self
		splitName: fullName
		to: [:dirPath :localName | ^ localName]

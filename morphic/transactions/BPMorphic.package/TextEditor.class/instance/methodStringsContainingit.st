menu messages
methodStringsContainingit
	"Open a browser on methods which contain the current selection as
	part of a string constant."
	self
		lineSelectAndEmptyCheck: [^ self].
	self systemNavigation browseMethodsWithString: self selection string
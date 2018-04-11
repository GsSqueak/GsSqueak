menu messages
methodSourceContainingIt
	"Open a browser on methods which contain the current selection in
	their source (case-sensitive full-text search of source). Slow!"
	self
		lineSelectAndEmptyCheck: [^ self].
	self systemNavigation browseMethodsWithSourceString: self selection string
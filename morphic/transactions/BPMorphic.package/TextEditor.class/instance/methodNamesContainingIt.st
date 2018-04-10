menu messages
methodNamesContainingIt
	"Open a browser on methods names containing the selected string"
	self
		lineSelectAndEmptyCheck: [^ self].
	Cursor wait
		showWhile: [self systemNavigation browseMethodsWhoseNamesContain: self selection string withBlanksTrimmed].
	Cursor normal show
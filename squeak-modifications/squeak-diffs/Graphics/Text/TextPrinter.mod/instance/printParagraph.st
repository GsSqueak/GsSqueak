printing
printParagraph
	| pageNum nextIndex |
	para destinationForm: form.
	pageNum := 1.
	nextIndex := 1.
	[form fillColor: Color white.
	self printHeader: pageNum.
	self printFooter: pageNum.
	nextIndex := self formatPage: pageNum startingWith: nextIndex.
	self flushPage.
	nextIndex isNil] whileFalse:[pageNum := pageNum + 1].
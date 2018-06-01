accessing
contents 
	"Depending on the current selection, different information is retrieved.
	Answer a string description of that information.  This information is the
	method in the currently selected context."

	^contents ifNil:
		[self selectedContext
			ifNotNil: [self selectedMessage]
			ifNil: [String new]] 
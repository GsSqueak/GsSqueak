menu
selectionReferences
	"Create a browser on all references to the association of the current selection."

	self selectionIndex <= self numberOfFixedFields ifTrue: [^ self changed: #flash].
	object class == MethodDictionary ifTrue: [^ self changed: #flash].
	self systemNavigation browseAllCallsOn: (object associationAt: (keyArray at: selectionIndex - self numberOfFixedFields))
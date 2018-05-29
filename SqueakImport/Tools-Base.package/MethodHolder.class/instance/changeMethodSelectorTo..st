miscellaneous
changeMethodSelectorTo: aSelector
	"Change my method selector as noted.  Reset currentCompiledMethod"

	methodSelector := aSelector.
	currentCompiledMethod := methodClass compiledMethodAt: aSelector ifAbsent: [nil]
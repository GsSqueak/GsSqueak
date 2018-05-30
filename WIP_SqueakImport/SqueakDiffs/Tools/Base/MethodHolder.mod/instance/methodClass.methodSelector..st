miscellaneous
methodClass: aClass methodSelector: aSelector
	methodClass := aClass.
	methodSelector := aSelector.
	currentCompiledMethod := aClass compiledMethodAt: aSelector ifAbsent: [nil]
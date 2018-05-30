event handling
okay
	| nArgs |
	target ifNotNil:[
		nArgs := selector numArgs.
		nArgs = 1 ifTrue:[target perform: selector with: (formChoices at: currentIndex)].
		nArgs = 2 ifTrue:[target perform: selector with: (formChoices at: currentIndex) with: argument]].
	coexistWithOriginal
		ifTrue:
			[self delete]
		ifFalse:
			[owner replaceSubmorph: self topRendererOrSelf by: target]
event handling
cancel
	coexistWithOriginal
		ifTrue:
			[self delete]
		ifFalse:
			[owner replaceSubmorph: self topRendererOrSelf by: target]
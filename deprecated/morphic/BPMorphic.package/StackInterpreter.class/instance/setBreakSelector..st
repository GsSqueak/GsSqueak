debug support
setBreakSelector: aString 
	(breakSelector := aString)
		ifNil: [breakSelectorLength := objectMemory minSmallInteger
			"nil's effective length is zero"]
		ifNotNil: [breakSelectorLength := self strlen: aString]
scripts-standard
doScript: scriptNameString 
	"On the next tick of the clock, run the given script once"
	Symbol
		hasInterned: scriptNameString
		ifTrue: [:sym | (self class includesSelector: sym)
				ifTrue: [costume
						addAlarm: #triggerScript:
						with: sym
						after: 1]]
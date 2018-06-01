diffs
defaultDiffsSymbol
	"Answer the code symbol to use when generically switching to diffing"

	^ Preferences diffsWithPrettyPrint 
		ifTrue:
			[#prettyDiffs]
		ifFalse:
			[#showDiffs]
private-debugger
hideFromDebugger

	| sndr sndrHome |
	^self cachesStack
		or: [(sndr := self sender) ~~ nil
			and: [(sndrHome := sndr home) ~~ nil
				and: [sndrHome cachesStack]]]
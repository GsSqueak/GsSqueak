error correction
removeUnusedTemporaryNamed: temp from: str lookingAt: currentBlock movingTempMarksOf: someBlocks 
	| start end |
	end := currentBlock tempsMark - 1.
	["Beginning at right temp marker..."
	start := end - temp size + 1.
	end < temp size
		or: [(str at: start)
				= $|]
		or: [temp
					= (str copyFrom: start to: end)
				and: [(str at: start - 1)
						= $| | (str at: start - 1) isSeparator & ((str at: end + 1)
							= $| | (str at: end + 1) isSeparator)]]]
		whileFalse: ["Search left for the unused temp"
			end := cue requestor nextTokenFrom: end direction: -1].
	(end < temp size
			or: [(str at: start)
					= $|])
		ifFalse: [(str at: start - 1)
					= $ 
				ifTrue: [start := start - 1].
			cue requestor
				correctFrom: start
				to: end
				with: ''.
			someBlocks
				do: [:aBlock | aBlock tempsMark: aBlock tempsMark - (end - start + 1)].
			^ true].
	^ false
editing
deletePoint: ix 
	"If the point is a limit point, return false,
	otherwise, delete the point at ix, and return true."

	(limits includes: ix) ifTrue: [^false].
	1 to: limits size
		do: 
			[:i | 
			"Decrease limit indices beyond the deletion"

			(limits at: i) > ix ifTrue: [limits at: i put: (limits at: i) - 1]].
	envelope 
		setPoints: (envelope points 
				copyReplaceFrom: ix
				to: ix
				with: Array new)
		loopStart: (limits first)
		loopEnd: (limits second).
	^true
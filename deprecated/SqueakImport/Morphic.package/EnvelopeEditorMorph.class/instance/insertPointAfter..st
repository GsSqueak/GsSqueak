editing
insertPointAfter: ix 
	"If there is not enough roon (in x) then return false.
	Otherwise insert a point between ix and ix+1 and return true."

	| points pt |
	points := envelope points.
	(points at: ix + 1) x - (points at: ix) x < 20 ifTrue: [^false].
	pt := ((points at: ix + 1) + (points at: ix)) // 2.
	1 to: limits size
		do: 
			[:i | 
			"Increase limit indices beyond the insertion"

			(limits at: i) > ix ifTrue: [limits at: i put: (limits at: i) + 1]].
	envelope 
		setPoints: (points 
				copyReplaceFrom: ix + 1
				to: ix
				with: (Array with: pt))
		loopStart: (limits first)
		loopEnd: (limits second).
	^true
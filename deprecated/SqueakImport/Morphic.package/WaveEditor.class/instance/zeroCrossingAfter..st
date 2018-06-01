other
zeroCrossingAfter: index
	"Find the index of the next negative-to-non-negative transition at or after the current index. The result is the index, i, of a zero crossing such that the sample at i-1 is negative and the sample at i is zero or positive. Answer the index of the last sample if the end of the array is encountered before finding a zero crossing."

	| data end i |
	data := graph data.
	end := data size.
	index <= 1 ifTrue: [^ 1].
	i := index - 1.
	[(i <= end) and: [(data at: i) >= 0]] whileTrue: [i := i + 1].  "find next negative sample"
	i >= end ifTrue: [^ end].

	i := i + 1.
	[(i <= end) and: [(data at: i) < 0]] whileTrue: [i := i + 1].  "find next non-negative sample"
	^ i

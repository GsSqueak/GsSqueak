new selection
selectWordLeftDelimiters: leftDelimiters rightDelimiters: rightDelimiters
	"Select delimited text or word--the result of double-clicking."

	| openDelimiter closeDelimiter direction match level
	string here hereChar start stop |
	string := self string.
	string size < 2 ifTrue: [^self].
	here := self pointIndex.
	"Select the whole text when clicking before first or after last character"
	(here > string size or: [here < 2]) ifTrue: [^self selectFrom: 1 to: string size].
	openDelimiter := string at: here - 1.
	closeDelimiter := string at: here.
	(match := leftDelimiters indexOf: openDelimiter) > (rightDelimiters indexOf: closeDelimiter)
		ifTrue: [
			"a more-distinct delimiter is on the left -- match to the right"
			start := here.
			direction := 1.
			here := here - 1.
			closeDelimiter := rightDelimiters at: match]
		ifFalse: [
			openDelimiter := string at: here.
			match := rightDelimiters indexOf: openDelimiter.
			match > 0
				ifTrue: [
					"delimiter is on right -- match to the left"
					stop := here - 1.
					direction := -1.
					closeDelimiter := leftDelimiters at: match]
				ifFalse: [
					"no delimiters -- select a token"
					direction := -1]].
	level := 1.
	[level > 0 and: [direction > 0
			ifTrue: [here < string size]
			ifFalse: [here > 1]]]
		whileTrue: [
			hereChar := string at: (here := here + direction).
			match = 0
				ifTrue: ["token scan goes left, then right"
					hereChar tokenish
						ifTrue: [here = 1
								ifTrue: [
									start := 1.
									"go right if hit string start"
									direction := 1]]
						ifFalse: [
							direction < 0
								ifTrue: [
									start := here + 1.
									"go right if hit non-token"
									direction := 1]
								ifFalse: [level := 0]]]
				ifFalse: ["bracket match just counts nesting level"
					hereChar = closeDelimiter
						ifTrue: [level := level - 1"leaving nest"]
						ifFalse: [hereChar = openDelimiter 
									ifTrue: [level := level + 1"entering deeper nest"]]]].

	level > 0 ifTrue: ["in case ran off string end"	here := here + direction].
	^direction > 0
		ifTrue: [self selectFrom: start to: here - 1]
		ifFalse: [self selectFrom: here + 1 to: stop]
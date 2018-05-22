converting
withoutLeadingBlanks
	"Return a copy of the receiver from which leading blanks have been trimmed."

	| first |
	first := string indexOfAnyOf: CharacterSet nonSeparators startingAt: 1.
	first = 0 ifTrue: [ ^'' ].  "no non-separator character"
	first = 1 ifTrue: [ ^self copy ].
	^self
		copyFrom: first
		to: self size

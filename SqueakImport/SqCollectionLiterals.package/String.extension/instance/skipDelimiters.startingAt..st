*SqCollectionLiterals-accessing
skipDelimiters: delimiters startingAt: start 
	"Answer the index of the character within the receiver, starting at start, that does NOT match one of the delimiters. If the receiver does not contain any of the delimiters, answer size + 1.  Assumes the delimiters to be a non-empty string."

	start to: self size do: [:i |
		(delimiters includes: (self at: i)) ifFalse: [ ^i ] ].
	^self size + 1

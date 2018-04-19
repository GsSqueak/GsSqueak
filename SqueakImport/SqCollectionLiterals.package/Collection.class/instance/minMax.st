*SqCollectionLiterals-*SqCollectionLiterals-math functions
minMax
	"Scans for minimum and maximum in one pass returning the results as a two-element array"
	| min max |
	min := max := self anyOne.
	self do: [ :each |
		min := min min: each.
		max := max max: each ].
	^ Array with: min with: max

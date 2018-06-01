enumerating differences
enumerateDifferencesByVersion

	"self enumerateDifferencesByVersion"

	| tables dict |
	dict := Dictionary new.
	tables := (self class selectors select: [ :sel | (sel beginsWith: #table) and: [ (sel includes: $: ) not] ]) sort.
	tables inject: nil into: [ :last :sel |
		last ifNotNil: [
			dict at: last -> sel
				put: ((self perform: last) difference: (self perform: sel))].
		sel ].
	^ dict.


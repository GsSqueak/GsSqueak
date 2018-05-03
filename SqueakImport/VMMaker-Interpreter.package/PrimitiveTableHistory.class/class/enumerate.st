enumerating differences
enumerate
	"For each change to the primitive table beginning with the version from
	Squeak 1.1, show the old and new table entiries."

	"self enumerate"

	| tables forwardDict reverseDict differenceDict |
	forwardDict := Dictionary new.
	tables := (self class selectors select: [ :sel | (sel beginsWith: #table) and: [ (sel includes: $: ) not] ]) sort.
	tables inject: nil into: [ :last :sel |
		last ifNotNil: [
			forwardDict at: last -> sel
				put: ((self perform: last) difference: (self perform: sel))].
		sel ].
	reverseDict := Dictionary new.
	tables := tables reversed.
	tables inject: nil into: [ :last :sel |
		last ifNotNil: [
			reverseDict at: sel -> last
				put: ((self perform: last) difference: (self perform: sel))].
		sel ].
	differenceDict := Dictionary new.
	forwardDict keysDo: [ :key |
		differenceDict at: key put: {(forwardDict at: key) . (reverseDict at: key)}].
	^ differenceDict.


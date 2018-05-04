enumerating differences
enumerateDifferencesVersusLatestForInterpreterVM

	"self enumerateDifferencesVersusLatestForInterpreterVM"

	| tables referencePoint dict |
	dict := Dictionary new.
	tables := (self class selectors select: [ :sel | (sel beginsWith: #table) and: [ (sel includes: $: ) not] ]) sort reversed.
	referencePoint := self latestForInterpreterVM.
	tables do: [ :table | dict at: table put: ((self perform: table) difference: referencePoint ) ].
	^ dict.


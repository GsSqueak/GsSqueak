positioning
adjustPositionVisAVisFlap
	| sideToAlignTo opposite |
	opposite := Utilities oppositeSideTo: edgeToAdhereTo.
	sideToAlignTo := inboard
		ifTrue:	[opposite]
		ifFalse:	[edgeToAdhereTo].
	self perform: sideToAlignTo asSimpleSetter with: (referent perform: opposite)
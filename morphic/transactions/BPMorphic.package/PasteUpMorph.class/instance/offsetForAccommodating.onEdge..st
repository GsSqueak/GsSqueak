flaps
offsetForAccommodating: anExtent onEdge: edgeSymbol 
	"Answer a delta to be applied to my submorphs in order tfor anExtent
	to be slid inboard on the indicated edge"
	edgeSymbol == #left
		ifTrue: [^ anExtent x @ 0].
	edgeSymbol == #right
		ifTrue: [^ anExtent x negated @ 0].
	edgeSymbol == #top
		ifTrue: [^ 0 @ anExtent y].
	edgeSymbol == #bottom
		ifTrue: [^ 0 @ anExtent y negated]
primitives-incremental
primAddActiveEdgeTableEntryFrom: edgeEntry
	"Add edge entry to the AET."
	
	(self canProceedAfter: self primGetFailureReason) ifTrue:[
		^self primAddActiveEdgeTableEntryFrom: edgeEntry
	].
	^ 0
primitives-incremental
primAddActiveEdgeTableEntryFrom: edgeEntry 
	"Add edge entry to the AET."
	self halt.
	(self canProceedAfter: self primGetFailureReason)
		ifTrue: [^ self primAddActiveEdgeTableEntryFrom: edgeEntry].
	^ self primitiveFailed
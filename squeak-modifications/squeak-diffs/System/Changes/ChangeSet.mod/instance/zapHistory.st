initialize-release
zapHistory 
	"Much stronger than trimHistory, but it should still leave the changeSet in good shape.
	Must not be done on revertable changeSets
		ChangeSet allInstancesDo: [:cs | cs zapHistory]."

	revertable ifTrue: [^ self].  "No can do"
	changeRecords do: [:chgRecord | chgRecord zapHistory]
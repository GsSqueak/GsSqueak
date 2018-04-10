drag and drop
wantsDroppedMorph: dropee event: evt inMorph: target 
	^ acceptDroppedMorphs
		or: [dropee isKindOf: TransferMorph]
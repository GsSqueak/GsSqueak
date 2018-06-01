events
wantsToBeDroppedInto: aMorph
	"Return true if it's okay to drop the receiver into aMorph"
	^ (aMorph isWorldMorph or:[Preferences systemWindowEmbedOK])
		and: [aMorph isDockingBar not]
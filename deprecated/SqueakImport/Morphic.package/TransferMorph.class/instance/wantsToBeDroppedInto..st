dropping/grabbing
wantsToBeDroppedInto: aMorph
	^ aMorph isWorldMorph
		ifTrue: [ aMorph hasTransferMorphConverter ]
		ifFalse: [ super wantsToBeDroppedInto: aMorph ]
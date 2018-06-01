dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	^ ((super wantsDroppedMorph: aMorph event: evt)
		and: [aMorph isKindOf: TransferMorph])
		and: [aMorph passenger isString or: [aMorph passenger isText]]
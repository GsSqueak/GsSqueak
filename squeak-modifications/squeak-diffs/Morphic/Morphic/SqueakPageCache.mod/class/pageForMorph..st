cache access
pageForMorph: aPasteUp

	PageCache do: [:squeakPage |
		squeakPage contentsMorph == aPasteUp ifTrue: [^ squeakPage]].
	^ nil
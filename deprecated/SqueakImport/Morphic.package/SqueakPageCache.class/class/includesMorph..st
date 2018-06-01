cache access
includesMorph: aPasteUp

	PageCache do: [:squeakPage |
		squeakPage contentsMorph == aPasteUp ifTrue: [^ true]].
	^ false
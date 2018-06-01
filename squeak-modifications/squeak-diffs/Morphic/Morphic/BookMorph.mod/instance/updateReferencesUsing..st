copying
updateReferencesUsing: aDictionary

	super updateReferencesUsing: aDictionary.
	pages do: [:page |
		page allMorphsDo: [:m | m updateReferencesUsing: aDictionary]].

scraps tab
hasScrapsTab
	pages detect: [:p | (p hasProperty: #scraps)] ifNone: [^ false].
	^ true
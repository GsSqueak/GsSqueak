menu commands
cancel
	self setText: self getText.
	self setSelection: self getSelection.
	getTextSelector == #annotation
		ifFalse: [(model dependents
				detect: [:dep | (dep isKindOf: PluggableTextMorph)
						and: [dep getTextSelector == #annotation]]
				ifNone: [])
				ifNotNil: [:aPane | model changed: #annotation]]
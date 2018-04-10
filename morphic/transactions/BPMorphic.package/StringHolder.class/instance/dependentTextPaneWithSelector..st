-Tools
dependentTextPaneWithSelector: aSelector 
	^ self dependents
		detect: [:aMorph | (aMorph isKindOf: PluggableTextMorph)
				and: [aMorph getTextSelector == aSelector]]
		ifNone: []
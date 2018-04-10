initialization
setTitleParameters
	self
		setTitleParametersFor: (self allMorphs
				detect: [:each | each hasProperty: #titleString]
				ifNone: [^ self])
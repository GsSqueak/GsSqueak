the actions
editProjectInfo

	Smalltalk at: #EToyProjectDetailsMorph ifPresent:[:aClass|
		aClass
			getFullInfoFor: (self world ifNil: [^self]) project
			ifValid: []
			expandedFormat: true
	].
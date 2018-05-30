navigation
insertNewProject

	| newProj |

	[newProj := MorphicProject openViewOn: nil.]
		on: ProjectViewOpenNotification
		do: [ :ex | ex resume: false].	

	Smalltalk at: #EToyProjectDetailsMorph ifPresent:[:aClass|
		aClass
			getFullInfoFor: newProj
			ifValid: [self insertNewProjectActionFor: newProj]
			expandedFormat: false.
	].


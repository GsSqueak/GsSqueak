as yet unclassified
insertNewProject: evt

	| newProj |

	[newProj := MorphicProject openViewOn: nil.]
		on: ProjectViewOpenNotification
		do: [ :ex | ex resume: false].	

	Smalltalk at: #EToyProjectDetailsMorph ifPresent:[:aClass|
		aClass
			getFullInfoFor: newProj
			ifValid: [
				evt hand attachMorph: (self sorterMorphForProjectNamed: newProj name)
			]
			expandedFormat: false.
	].
menu messages
validateProjectNameIfOK: aBlock

	| details |

	details := world valueOfProperty: #ProjectDetails.
	details ifNotNil: ["ensure project info matches real project name"
		details at: 'projectname' put: self name.
	].
	self doWeWantToRename ifFalse: [^ aBlock value: details].
	(Smalltalk at: #EToyProjectDetailsMorph) ifNotNil: [:etpdm |
		etpdm
			getFullInfoFor: self 
			ifValid: [:d |
				Project current world displayWorldSafely.
				aBlock value: d
			]
			expandedFormat: false]

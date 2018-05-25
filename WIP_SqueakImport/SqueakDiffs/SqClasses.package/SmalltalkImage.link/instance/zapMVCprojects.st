*SqClasses-*SqClasses-*SqClasses-shrinking
zapMVCprojects
	"Smalltalk zapMVCprojects"

	(Smalltalk classNamed: #MVCProject)
		ifNotNil: [:mvc | mvc removeProjectsFromSystem]

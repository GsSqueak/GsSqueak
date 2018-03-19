helpers
codeForClassOrganizerOn: environmentProxy

	^ '(ClassOrganizer _newWithRoot: Object symbolList: ' , 
				environmentProxy codeReferencingMe , ' env: 0)'
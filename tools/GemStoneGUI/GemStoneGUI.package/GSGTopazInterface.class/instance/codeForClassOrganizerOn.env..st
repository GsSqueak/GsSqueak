helpers
codeForClassOrganizerOn: environmentProxy env: envId

	^ '(ClassOrganizer _newWithRoot: Object symbolList: ' , 
				environmentProxy codeReferencingMe , ' env: ' , envId , ')'
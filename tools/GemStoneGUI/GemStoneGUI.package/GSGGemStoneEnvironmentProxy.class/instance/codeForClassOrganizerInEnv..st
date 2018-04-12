query assembly
codeForClassOrganizerInEnv: envId

	^ '(ClassOrganizer 
		_newWithRoot: Object
		symbolList: ' , self codeReferencingMe , '
		env: ' , envId , ')'
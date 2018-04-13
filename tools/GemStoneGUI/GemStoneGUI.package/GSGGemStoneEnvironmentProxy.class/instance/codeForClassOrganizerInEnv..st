query assembly
codeForClassOrganizerInEnv: envId

	^ '(ClassOrganizer 
		_newWithRoot: Object
		symbolList: ' , self codeReferencingSymbolList , '
		env: ' , envId , ')'
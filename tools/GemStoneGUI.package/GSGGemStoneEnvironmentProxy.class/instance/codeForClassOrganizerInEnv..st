query assembly
codeForClassOrganizerInEnv: envId

	^ '(ClassOrganizer 
		_newWithRoot: Object
		symbolList: {1}
		env: {2})'
			format: {
				self codeReferencingSymbolList.
				envId}
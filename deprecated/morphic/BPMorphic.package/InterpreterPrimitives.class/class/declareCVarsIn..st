C translation
declareCVarsIn: aCCodeGen 
	aCCodeGen var: 'osErrorCode' type: #sqLong;
		 var: 'sHEAFn' declareC: 'int (*sHEAFn)() = 0'
	"the hasEnvironmentAccess function"
comparing
analogousCodeTo: anObject
	"For MethodProperties comparison."
	^anObject isVariableBinding
	  and: [key = anObject key
	  and: [value = anObject value]]
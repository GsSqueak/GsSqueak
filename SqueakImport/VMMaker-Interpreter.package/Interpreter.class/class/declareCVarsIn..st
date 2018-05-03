translation
declareCVarsIn: aCCodeGenerator

	aCCodeGenerator var: 'semaphoresToSignalA' declareC: 'sqInt semaphoresToSignalA[' , (SemaphoresToSignalSize + 1) printString , ']'.
	aCCodeGenerator var: 'semaphoresToSignalB' declareC: 'sqInt semaphoresToSignalB[' , (SemaphoresToSignalSize + 1) printString , ']'.


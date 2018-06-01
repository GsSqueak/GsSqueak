compiled methods
accessModifierOfMethod: methodObj 
	^ self
		accessModifierOfMethodHeader: (objectMemory methodHeaderOf: methodObj)
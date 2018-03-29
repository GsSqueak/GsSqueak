compiled methods
isProtectedMethod: methodObj 
	^ (self accessModifierOfMethod: methodObj)
		= AccessModifierProtected
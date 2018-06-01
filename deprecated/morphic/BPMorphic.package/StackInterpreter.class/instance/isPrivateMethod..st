compiled methods
isPrivateMethod: methodObj 
	^ (self accessModifierOfMethod: methodObj)
		= AccessModifierPrivate
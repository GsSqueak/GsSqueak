compiled methods
isPublicMethod: methodObj 
	^ (self accessModifierOfMethod: methodObj)
		= AccessModifierPublic
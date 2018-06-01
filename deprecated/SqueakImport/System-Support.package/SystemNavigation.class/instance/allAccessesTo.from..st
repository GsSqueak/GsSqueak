query
allAccessesTo: instVarName from: aClass
	"Return a sequence of MethodReferences of all methods of aClass or it's sub/superclass that refer to the instance variable instVarName."
	
	| result |
	result := OrderedCollection new.
	aClass withAllSubAndSuperclassesDo:
		[ :class | 
		(class whichSelectorsAccess: instVarName) do:
			[ :selector |
			result add: (MethodReference class: class selector: selector) ] ].
	^result
testing method dictionary
whichMethodsStoreInto: instVarName 
	"Answer a collection of CompiledMethod whose methods access the argument, instVarName, as a named instance variable."
	
	| instVarIndex |
	instVarIndex := self instVarIndexFor: instVarName ifAbsent: [ ^Array new ].
	^self methodDict values select: [:eachMethod | eachMethod writesField: instVarIndex ]
	
	"Point whichMethodsStoreInto: 'x'."
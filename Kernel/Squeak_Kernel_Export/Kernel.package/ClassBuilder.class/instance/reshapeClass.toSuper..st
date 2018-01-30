class mutation
reshapeClass: oldClass toSuper: newSuper
	"Reshape the given class to the new super class. Recompile all the methods in the newly created class. Answer the new class."
	| instVars |
	instVars := instVarMap at: oldClass name ifAbsent: [oldClass instVarNames].

	^self newSubclassOf: newSuper 
			type: oldClass typeOfClass 
			instanceVariables: instVars 
			from: oldClass
initialize-release
declare: varString 
	"Declare class variables common to all instances. Answer whether 
	recompilation is advisable."

	| newVars conflicts |
	
	newVars := 
		(Scanner new scanFieldNames: varString)
			collect: [:x | x asSymbol].
	newVars do:
		[:var | var first canBeGlobalVarInitial
			ifFalse: [self error: var, ' class variable name should be capitalized; proceed to include anyway.']].
	conflicts := false.
	classPool == nil 
		ifFalse: [(classPool keys reject: [:x | newVars includes: x]) do: 
					[:var | self removeClassVarName: var]].
	(newVars reject: [:var | self classPool includesKey: var])
		do: [:var | "adding"
			"check if new vars defined elsewhere"
			(self canFindWithoutEnvironment: var) ifTrue: [
					(DuplicateVariableError new)
						superclass: superclass; "fake!!!"
						variable: var;
						signal: var, ' is already defined'.
					conflicts := true]].
	newVars size > 0
		ifTrue: 
			[classPool := self classPool.
			"in case it was nil"
			newVars do: [:var | classPool declare: var from: self environment undeclared]].
	^conflicts
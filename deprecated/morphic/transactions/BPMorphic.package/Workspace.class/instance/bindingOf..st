binding
bindingOf: aString 
	mustDeclareVariables
		ifTrue: [^ nil].
	"I want to have workspace that force the user to declare 
	variables. Still subclasses may want to do something else"
	(bindings includesKey: aString)
		ifFalse: [(self lookupInPools: aString)
				ifNil: [aString first isUppercase
						ifTrue: [^ nil]
						ifFalse: [bindings at: aString put: nil]]
				ifNotNil: [:val | "Caveat: since we're not inserting the pool's Association
					into the dictionary, assigning a new value to the
					variable will only
					affect the one Workspace (i.e. you can't assign to a
					variable in a
					SharedPool)."
					bindings at: aString put: val]].
	^ bindings associationAt: aString
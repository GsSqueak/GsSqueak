selecting
selection 
	"Refer to the comment in Inspector|selection."
	selectionIndex = 0 ifTrue:[^''].
	selectionIndex = 1 ifTrue: [^object].
	selectionIndex = 2 ifTrue: [^object actualStackSize > 0 ifTrue: [object top] ifFalse: ['']].
	selectionIndex = 3 ifTrue: [^object tempsAndValues].
	^object debuggerMap namedTempAt: selectionIndex - 3 in: object
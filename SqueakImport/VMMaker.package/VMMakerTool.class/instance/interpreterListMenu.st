menus
interpreterListMenu
	"create a menu of interpreter type selections. Use a list of descriptive names and
	translate the selection to a class name appropriate for that selection. Note that this
	is not necessarily the name of an interpreter class per se."

	| choice interp |
	choice := (PopUpMenu labelArray: InterpreterTypes
				lines: #()) startUp.
	choice = 0 ifTrue: [^self].
	interp := (InterpreterTypes at: choice)
		caseOf: {
				[ 'Context interpreter' ] -> [ 'ContextInterpreter' ] .
				[ 'Stack interpreter' ] -> [ 'StackInterpreterPrimitives' ]
			}
		otherwise: [ 'ContextInterpreter' ].
	self interpreterClassName: interp asText
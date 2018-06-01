initialization
dismissViaHalo
	| choice |
	project ifNil:[^self delete]. "no current project"
	choice := UIManager default chooseFrom: {
		'yes - delete the window and the project' translated.
		'no - delete the window only' translated
	} title: ('Do you really want to delete {1}
and all its content?' translated format: {project name printString}).
	choice = 1 ifTrue:[^self expungeProject].
	choice = 2 ifTrue:[^self delete].
the actions
doFindButtonMenuEvent: evt

	| selection |
	selection := UIManager default chooseFrom:{
		'find a project' translated.
		'find a project (more places)' translated.
		'find any file' translated.
		'search the SuperSwiki' translated.
	} values: { 
		[self findAProjectSimple].
		[self findAProject].
		[self findAnything].
		[self findSomethingOnSuperSwiki].
	} title: 'Find options' translated.
	selection ifNil: [^self].
	selection value.


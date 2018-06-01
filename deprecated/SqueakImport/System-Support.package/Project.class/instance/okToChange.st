release
okToChange
	"Answer whether the window in which the project is housed can be dismissed -- which is destructive. We never clobber a project without confirmation"

	| answer |
	(self confirm: ('Do you really want to delete the project\{1}\and all its content?' withCRs translated format:{self name}))
		ifFalse: [^ false].

	self subProjects ifNotEmpty: [:sp |
		answer := Project uiManager
			chooseFrom: #(
				"1" 'Lift all sub-projects'
				"2" 'Discard all sub-projects (NO UNDO!)'
				"3 or 0" 'Cancel')
			lines: #(2)
			title: ('The project {1}\contains {2} sub-project(s).' withCRs translated format:{self name. sp size}).
		
		(answer = 0 or: [answer = 3]) ifTrue: [^ false].
		answer = 1 ifTrue: [self liftSubProjects. ^ true].
		answer = 2 ifTrue: [^ sp allSatisfy: [:ea | ea okToChange]]].
	
	^ true
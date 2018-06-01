preferences
redirectToStdOut: aBoolean

	(RedirectToStdOut := aBoolean)
		ifTrue: [Transcript addDependent: FileStream stdout]
		ifFalse: [Transcript removeDependent: FileStream stdout].
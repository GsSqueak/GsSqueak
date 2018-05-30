subprojects
addProject: project

	| view |
	super addProject: project.
	
	view := Preferences projectViewsInWindows
		ifTrue: [ProjectViewMorph newProjectViewInAWindowFor: project]
		ifFalse: [ProjectViewMorph on: project].
	
	"Do not use #openInWorld: because SystemWindow does things with real-estate manager, which depends on too much global state."
	self world
		addMorph: view;
		startSteppingSubmorphsOf: view.
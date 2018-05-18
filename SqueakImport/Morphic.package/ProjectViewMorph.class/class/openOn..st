instance creation
openOn: aProject
	"Open a ProjectViewMorph for the project in question"
	ProjectViewOpenNotification signal ifTrue: [
		Preferences projectViewsInWindows ifTrue: [
			(self newProjectViewInAWindowFor: aProject) openInWorld
		] ifFalse: [
			(self on: aProject) openInWorld		"but where??"
		].
	].

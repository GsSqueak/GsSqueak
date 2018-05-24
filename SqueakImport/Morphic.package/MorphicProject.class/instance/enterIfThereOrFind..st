squeaklet on server
enterIfThereOrFind: aProjectName

	| newProject |
	newProject := Project named: aProjectName.
	newProject ifNotNil: [^newProject enter].

	ComplexProgressIndicator new 
		targetMorph: nil;
		historyCategory: 'project loading';
		withProgressDo: [
			[
				newProject := self fromMyServerLoad: aProjectName
			] 
				on: ProjectViewOpenNotification
				do: [ :ex | ex resume: false]		
					"we probably don't want a project view morph in this case"
		].

	newProject ifNotNil: [^newProject enter].
	Beeper beep.
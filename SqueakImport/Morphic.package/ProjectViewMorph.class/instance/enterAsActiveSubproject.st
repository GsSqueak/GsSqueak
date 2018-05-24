events
enterAsActiveSubproject
    "Enter my project."

    project class == DiskProxy 
        ifTrue: 
            ["When target is not in yet"

            [self enterWhenNotPresent    "will bring it in"] on: ProjectEntryNotification
                do: [:ex | ^ex projectToEnter enterAsActiveSubprojectWithin: self world].
            project class == DiskProxy ifTrue: [self error: 'Could not find view']].
    (owner isSystemWindow) ifTrue: [project setViewSize: self extent].
    self showMouseState: 3.
    project enterAsActiveSubprojectWithin: self world
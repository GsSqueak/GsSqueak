user-interface
selectTabOfBook: aBook
	self tabMorphs do:
		[:aTab | aTab morphToInstall == aBook ifTrue: [^ self selectTab: aTab]]
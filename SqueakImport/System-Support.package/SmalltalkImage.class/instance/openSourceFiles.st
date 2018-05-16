sources, changes log
openSourceFiles

	self imageName = LastImageName ifFalse:
		["Reset the author initials to blank when the image gets moved"
		LastImageName := self imageName.
		Utilities setAuthorInitials: ''].
	FileDirectory
		openSources: self sourcesName
		andChanges: self changesName
		forImage: LastImageName.
	SourceFileArray install
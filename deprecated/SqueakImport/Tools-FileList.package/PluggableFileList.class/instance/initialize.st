initialize-release
initialize

	super initialize.
	prompt := 'Select File'.
	directory := FileDirectory default.
	newFiles := OrderedCollection new.
	fileFilterBlock := PluggableFileList allFilesAndFoldersFileFilter.
	canAcceptBlock := PluggableFileList fileNameSelectedAcceptBlock.
	resultBlock := PluggableFileList pathNameResultBlock.
	validateBlock := PluggableFileList checkExistingFileValidateBlock.

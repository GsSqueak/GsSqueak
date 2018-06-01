instance creation
getFilePathNameDialogWithExistenceCheck

	^(self new)
		prompt: 'Select New File:';
		validateBlock: PluggableFileList checkExistingFileValidateBlock;
		yourself
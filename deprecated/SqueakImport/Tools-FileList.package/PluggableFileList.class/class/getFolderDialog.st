instance creation
getFolderDialog

	^(self new)
		prompt: 'Select a Folder';
		fileFilterBlock: PluggableFileList allFoldersFileFilter;
		canAcceptBlock: PluggableFileList alwaysAcceptBlock;
		resultBlock: PluggableFileList directoryResultBlock;
		validateBlock: PluggableFileList alwaysValidateBlock;
		yourself
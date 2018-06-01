standard file operations
newFileFrom: aDirectory

	^(self newFileMenu: aDirectory)
		startUpWithCaption: 'Select a File:' translated
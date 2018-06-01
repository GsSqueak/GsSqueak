file in/out
findAFolderToStoreProjectIn

	^ CurrentProject findAFolderForProject: self label: 'Select a folder on a server:'

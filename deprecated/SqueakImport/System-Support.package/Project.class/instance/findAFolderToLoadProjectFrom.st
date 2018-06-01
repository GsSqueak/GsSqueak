file in/out
findAFolderToLoadProjectFrom

	^ CurrentProject findAFolderForProject: self label: 'Select a folder on a server:'

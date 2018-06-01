A DirectoryChooserDialog is a modal dialog to allow choosing a directory. The full directory name is returned, or nil if no selection was made.

Normal usage would be 
	myDirname := DirectoryChooserDialog openOn: myApplicationDefaultDirectory label: 'Choose the directory to use'

A FileSaverDialog is a modal dialog for choosing a file name to use for saving a file.

Users can enter a filename in the text input view that will 
a) if it exists in the current directry listing, be selected
b) over ride any filenames in the current directory, providing a way to specify a completely new file.
This will not affect the selected directory path.

Normal usage would be 
	myFilename := FileSaverDialog openOnInitialFilename: myApp saveFileName
which would derive a directory, an initial filename and filename suffix from the given file name. Thus a typical application save might be 
	...  openOnInitialFilename: '/home/pi/myApp/examplePicture.jpg'
and would set the initial directory to /home/pi/myapp, the initial filename to examplePicture.jpg and set a suffix pattern of 'jpg'. Only filenames with the specified suffix will appear in the file list view. It is possible to specify several suffices, (see #suffixList:) and use wildcards within the suffix.

	myFilename := FileSaverDialog openOn: myApplicationDefaultDirectory initialFilename: 'foo.myapp'
would set directory initial choice set to myApplicationDefaultDirectory and ignore any directory found in the filename. It would be quite possible to choose a file from any other directory and with any other name  that matches the suffix if the user wishes, so the file name must be carefully checked. 

The full set of options would involve
	myFilename := FileSaverDialog  openOn: myApplicationDefaultDirectory initialFilename: 'foo.myapp' suffix: 'mya' message: 'Save your myApp file to ... '

It is also possible to set a more general pattern to match filenames against but since this seems less useful for normal application usage there are no convenience messages as yet.

See the class side methods for details. See my parent class for most implementation details
A FileChooserDialog is a modal dialog to allow choosing a file. The full file name is returned, or nil if no selection was made.

Normal usage would be 
	myFilename := FileChooserDialog openOn: myApplicationDefaultDirectory pattern: '*.myapp' label: 'Choose the file to load'
to find a file with a name matching *.myapp and with the directory initial choice set to myApplicationDefaultDirectory.  Only filenames matching the pattern will appear in the file list view.

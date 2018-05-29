FileAbstractSelectionDialog is the abstract superclass for the file chooser & saver modal dialogs.

The UI provides a message  to the user, a text input field, a directory tree widget and a list of files within any chosen directory, and buttons to accept the selected file name/path or cancel the operation. See subclass comments and class side methods for specific usage examples.

Instance Variables
	directory:		<FileDirectory> used for the currently selected directory
	directoryCache:		<WeakIdentityKeyDictionary> used to cache a boolean to help us more quickly populate the directory tree widget when revisiting a directory
	fileName:		<String|nil> the name of the currently selected file, if any
	finalChoice:		<String|nil> pathname of the finally chosen file, returned as the result of accepting; nil is returned otherwise
	list:		<Array> the list of String of filenames (and date/size) that match the current pattern 
	listIndex:		<Integer> list index of the currently selected file
	patternList:		<OrderedCollection of String> the patterns are held as a collection of string that may include * or # wildcards. See FileAbstractSelectionDialog>>#parsePatternString for details
	message:		<String> a message to the user to explain what is expected 
	nameList,DateList, sizeList:	<Array> the list of file names matching the pattern and the appropriate date and size values, formatted for a PluggableMultiColumnListMorph
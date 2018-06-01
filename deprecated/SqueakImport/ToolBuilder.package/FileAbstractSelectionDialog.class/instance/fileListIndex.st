file list
fileListIndex
	"return the index in the list of files for the currently selected file; we initialise this to 0 so that the initial listmorph doesn't get upset before we actually populate it with file details - which we don't do until a directory is selected"
	
	^listIndex
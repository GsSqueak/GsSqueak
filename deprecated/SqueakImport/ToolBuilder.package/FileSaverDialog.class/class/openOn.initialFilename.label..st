instance creation
openOn: aDirectory initialFilename: aString label: labelString
	"Open a modal dialog to save a file. Start the dialog with aDirectory selected
	and aString as the suggested file name. Set the user message to labelString.
	Note that we set the directory after the initialFilename becuase we want a
	specific directory and not neccesarily the directory of the file"

	"FileSaverDialog openOn: FileDirectory default initialFilename: 'aSuggestedFileName' label: 'Select a flie and do something with it' "

	^self new
		initialFilename: aString;
		directory: aDirectory;
		message: labelString;
		getUserResponse

	
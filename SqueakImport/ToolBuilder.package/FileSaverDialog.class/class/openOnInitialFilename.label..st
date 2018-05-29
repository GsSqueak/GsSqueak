instance creation
openOnInitialFilename: filenameString label: labelString
	"Open a modal dialog to save a file. Start the dialog with the default directory
	selected and the suggested file name, set the user message to labelString"

	"FileSaverDialog openOnInitialFilename: 'aSuggestedFileName' label: 'Select a flie and do something with it' "

	^self openOn: nil initialFilename: filenameString label: labelString

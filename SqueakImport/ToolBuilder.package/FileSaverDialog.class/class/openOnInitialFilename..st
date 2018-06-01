instance creation
openOnInitialFilename: filenameString
	"Open a modal dialog to save a file. Start the dialog with the default directory
	selected and the suggested file name."

	"FileSaverDialog openOnInitialFilename: 'aSuggestedFileName' "

	^self openOn: nil initialFilename: filenameString label: nil

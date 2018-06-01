instance creation
openOn: aDirectory
	"open a modal dialog to save a file. Start the dialog with aDirectory selected
	and no suggested file name"

	"FileSaverDialog openOn: FileDirectory default"

	^self openOn: aDirectory initialFilename: nil label: nil
	
instance creation
openOn: aDirectory
	"Open a modal dialog to choose a file. Start the dialog with aDirectory selected
	and files matching the default 'everything' pattern"

	"FileChooserDialog openOn: FileDirectory default"

	^self openOn: aDirectory pattern: nil label: nil

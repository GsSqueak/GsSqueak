instance creation
openOnPattern: matchString label: labelString
	"Open a modal dialog to choose a file. Start the dialog with a default directory
	selected and with files matching the default 'everything' pattern  Set the user
	message to labelString"

	"FileChooserDialog openOnPattern: '*.changes' label: 'Do something with the selected files' "

	^self openOn: nil pattern: matchString label: labelString

instance creation
openOn: aDirectory pattern: matchString label: labelString
	"Open a modal dialog to choose a file. Start the dialog with aDirectory selected
	and files matching the matchString pattern. Set the user message to labelString."

	"FileChooserDialog openOn: FileDirectory default pattern: '*.changes' label: 'Do something with the selected files' "

	^self new
		directory: aDirectory;
		pattern: matchString;
		message: labelString;
		getUserResponse
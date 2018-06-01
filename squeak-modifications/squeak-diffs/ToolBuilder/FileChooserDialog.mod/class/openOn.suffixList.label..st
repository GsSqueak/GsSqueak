instance creation
openOn: aDirectory suffixList: patternList label: labelString
	"Open a modal dialog to choose a file. Start the dialog with aDirectory selected
	and files matching the file name suffixes in patternList. Set the user message
	to labelString."

	"FileChooserDialog openOn: FileDirectory default suffixList: { '*.changes' . '*image' } label: 'Do something with the selected files' "

	^self new
		directory: aDirectory;
		suffixList: patternList;
		message: labelString;
		getUserResponse
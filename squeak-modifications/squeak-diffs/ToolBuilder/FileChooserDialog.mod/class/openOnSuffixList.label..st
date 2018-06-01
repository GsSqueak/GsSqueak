instance creation
openOnSuffixList: patternList label: labelString
	"Open a modal dialog to choose a file. Start the dialog with a default directory
	selected and with files matching the file name suffixes in patternList. Set the
	user message to labelString."

	"FileChooserDialog openOnSuffixList: { '*.changes' . '*image' } label: 'Do something with the selected files' "

	^self openOn: nil suffixList: patternList label: labelString

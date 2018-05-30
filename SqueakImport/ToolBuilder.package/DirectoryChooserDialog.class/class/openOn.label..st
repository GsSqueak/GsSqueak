instance creation
openOn: aDirectory label: labelString
	"open a directory chooser starting with aDirectory"

	"DirectoryChooserDialog openOn: FileDirectory default label: 'Choose the directory to use' "

	^super new
		directory: aDirectory;
		message: labelString;
		getUserResponse
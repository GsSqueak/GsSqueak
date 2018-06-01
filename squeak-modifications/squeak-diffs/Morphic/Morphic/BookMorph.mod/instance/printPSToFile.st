menus
printPSToFile
	"Ask the user for a filename and print this morph as postscript."

	| fileName rotateFlag |
	fileName := 'MyBook' translated asFileName.
	fileName := UIManager default
					saveFilenameRequest: 'Filename to save BookMorph' translated 
					initialAnswer: fileName.
	fileName isEmptyOrNil ifTrue: [^ Beeper beep].
	(fileName endsWith: '.ps') ifFalse: [fileName := fileName,'.ps'].

	rotateFlag := (UIManager default chooseFrom: {
		'portrait (tall)' translated.
		'landscape (wide)' translated
	} title: 'Choose orientation...' translated) = 2.

	FileStream newFileNamed: fileName do: [:file|
		file nextPutAll: (DSCPostscriptCanvas morphAsPostscript: self rotated: rotateFlag)]
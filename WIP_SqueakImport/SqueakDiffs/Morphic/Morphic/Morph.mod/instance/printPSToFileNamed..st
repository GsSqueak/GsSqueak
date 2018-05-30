*Morphic-MorphicExtras-menus
printPSToFileNamed: aString 
	"Ask the user for a filename and print this morph as postscript."
	| fileName rotateFlag psCanvasType psExtension |

	psCanvasType := PostscriptCanvas defaultCanvasType.
	psExtension := psCanvasType defaultExtension.
	fileName := UIManager default saveFilenameRequest: 'File name? '
			initialAnswer: (aString, psExtension) asFileName.
	fileName ifNil: [^ Beeper beep].

	rotateFlag := (UIManager default chooseFrom: {
		'portrait (tall)' translated.
		'landscape (wide)' translated.
	} title: 'Choose orientation...' translated) = 2.
	((FileStream newFileNamed: fileName) converter: TextConverter defaultSystemConverter)
		nextPutAll: (psCanvasType morphAsPostscript: self rotated: rotateFlag);
		 close
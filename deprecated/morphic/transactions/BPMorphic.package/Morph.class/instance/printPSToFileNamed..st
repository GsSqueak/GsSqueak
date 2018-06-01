-MorphicExtras-menus
printPSToFileNamed: aString 
	"Ask the user for a filename and print this morph as postscript."
	| _gsSqueakTemp_fileName _gsSqueakTemp_rotateFlag _gsSqueakTemp_psCanvasType _gsSqueakTemp_psExtension |
	_gsSqueakTemp_fileName := aString asFileName.
	_gsSqueakTemp_psCanvasType := PostscriptCanvas defaultCanvasType.
	_gsSqueakTemp_psExtension := _gsSqueakTemp_psCanvasType defaultExtension.
	_gsSqueakTemp_fileName := UIManager default
				request: (String
						streamContents: [:s | s
								nextPutAll: ('File name? ("{1}" will be added to end)' translated format: {_gsSqueakTemp_psExtension})])
				initialAnswer: _gsSqueakTemp_fileName.
	_gsSqueakTemp_fileName isEmpty
		ifTrue: [^ Beeper beep].
	(_gsSqueakTemp_fileName endsWith: _gsSqueakTemp_psExtension)
		ifFalse: [_gsSqueakTemp_fileName := _gsSqueakTemp_fileName , _gsSqueakTemp_psExtension].
	_gsSqueakTemp_rotateFlag := (UIManager default chooseFrom: {'portrait (tall)' translated. 'landscape (wide)' translated} title: 'Choose orientation...' translated)
				= 2.
	((FileStream newFileNamed: _gsSqueakTemp_fileName asFileName)
		converter: TextConverter defaultSystemConverter)
		nextPutAll: (_gsSqueakTemp_psCanvasType morphAsPostscript: self rotated: _gsSqueakTemp_rotateFlag);
		 close
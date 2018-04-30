menus
printPSToFile
	"Ask the user for a filename and print this morph as postscript."
	| _gsSqueakTemp_fileName _gsSqueakTemp_rotateFlag |
	_gsSqueakTemp_fileName := 'MyBook' translated asFileName.
	_gsSqueakTemp_fileName := UIManager default request: 'File name? (".ps" will be added to end)' translated initialAnswer: _gsSqueakTemp_fileName.
	_gsSqueakTemp_fileName isEmpty
		ifTrue: [^ Beeper beep].
	(_gsSqueakTemp_fileName endsWith: '.ps')
		ifFalse: [_gsSqueakTemp_fileName := _gsSqueakTemp_fileName , '.ps'].
	_gsSqueakTemp_rotateFlag := (UIManager default chooseFrom: {'portrait (tall)' translated. 'landscape (wide)' translated} title: 'Choose orientation...' translated)
				= 2.
	(FileStream newFileNamed: _gsSqueakTemp_fileName asFileName)
		nextPutAll: (DSCPostscriptCanvas morphAsPostscript: self rotated: _gsSqueakTemp_rotateFlag);
		 close
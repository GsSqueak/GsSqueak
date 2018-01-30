translation
storeString: s onFileNamed: fileName 
	"Store the given string in a file of the given name."
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := CrLfFileStream forceNewFileNamed: fileName.
	_gsSqueakTemp_f nextPutAll: s.
	_gsSqueakTemp_f close
instance creation
openEditorOn: aFileStream editString: editString 
	"Open an editor on the given FileStream."
	| _gsSqueakTemp_fileModel _gsSqueakTemp_topView _gsSqueakTemp_builder |
	_gsSqueakTemp_fileModel := FileList new setFileStream: aFileStream.
	"closes the stream"
	_gsSqueakTemp_builder := ToolBuilder default.
	_gsSqueakTemp_topView := _gsSqueakTemp_fileModel buildEditorWith: _gsSqueakTemp_builder.
	^ _gsSqueakTemp_builder open: _gsSqueakTemp_topView
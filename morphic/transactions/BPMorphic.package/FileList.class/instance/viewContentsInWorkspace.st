own services
viewContentsInWorkspace
	"View the contents of my selected file in a new workspace"
	| _gsSqueakTemp_aString _gsSqueakTemp_aFileStream _gsSqueakTemp_aName |
	_gsSqueakTemp_aString := (_gsSqueakTemp_aFileStream := directory readOnlyFileNamed: self fullName) setConverterForCode contentsOfEntireFile.
	_gsSqueakTemp_aName := _gsSqueakTemp_aFileStream localName.
	_gsSqueakTemp_aFileStream close.
	UIManager default edit: _gsSqueakTemp_aString withSqueakLineEndings label: 'Workspace from ' , _gsSqueakTemp_aName
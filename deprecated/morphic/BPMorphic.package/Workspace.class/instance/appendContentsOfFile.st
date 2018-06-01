menu commands
appendContentsOfFile
	"Prompt for a file, and if one is obtained, append its contents to the
	contents of the receiver. Caution: as currently implemented this
	abandons any custom style information previously in the workspace.
	Someone should fix this. Also, for best results you should accept the
	contents of the workspace before requesting this."
	| _gsSqueakTemp_aFileStream |
	(_gsSqueakTemp_aFileStream := FileList2 modalFileSelector)
		ifNil: [^ self].
	contents := (contents
				ifNil: ['']) asString , _gsSqueakTemp_aFileStream contentsOfEntireFile.
	_gsSqueakTemp_aFileStream close.
	self changed: #contents
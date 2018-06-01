file menu action
renameFile
	"Rename the currently selected file"
	| _gsSqueakTemp_newName _gsSqueakTemp_response |
	listIndex = 0
		ifTrue: [^ self].
	self okToChange
		ifFalse: [^ self].
	(_gsSqueakTemp_response := UIManager default request: 'NewFileName?' translated initialAnswer: fileName) isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_newName := _gsSqueakTemp_response asFileName.
	_gsSqueakTemp_newName = fileName
		ifTrue: [^ self].
	directory rename: fileName toBe: _gsSqueakTemp_newName.
	self updateFileList.
	listIndex := list
				findFirst: [:item | (self fileNameFromFormattedItem: item)
						= _gsSqueakTemp_newName].
	listIndex > 0
		ifTrue: [fileName := _gsSqueakTemp_newName].
	self changed: #fileListIndex
file menu action
renameFile
	"Rename the currently selected file"
	| newName response |
	listIndex = 0 ifTrue: [^ self].
	self okToChange ifFalse: [^ self].
	(response := UIManager default request: 'NewFileName?' translated
 					initialAnswer: fileName)
		isEmpty ifTrue: [^ self].
	newName := response asFileName.
	newName = fileName ifTrue: [^ self].
	directory rename: fileName toBe: newName.
	self updateFileList.
	listIndex := list findFirst: [:item | (self fileNameFromFormattedItem: item) = newName].
	listIndex > 0 ifTrue: [fileName := newName].
	self changed: #fileListIndex.

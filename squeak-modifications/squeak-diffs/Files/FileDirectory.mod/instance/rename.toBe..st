file operations
rename: oldFileName toBe: newFileName 
	"Rename the file of the given name to the new name. Fail if there is no file of the old name or if there is an existing file with the new name."
	"Modified for retry after GC ar 3/21/98 18:09"
	| replaceIt oldName newName |
	oldName := self fullNameFor: oldFileName.
	newName := self fullNameFor: newFileName.
	((self fileExists: oldFileName) or: [ (self directoryExists: oldFileName) ]) ifFalse: [ ^ self error: 'Attempt to rename a non-existent file or directory.' ].
	(self fileExists: newFileName) ifTrue:
		[replaceIt := (ReplaceExistingFileException fileName: newFileName) signal.
		replaceIt ifTrue: [ self deleteFileNamed: newFileName ]	ifFalse: [ ^ self ]].
	(self directoryExists: newFileName) ifTrue: [ FileExistsException signal: newFileName, ' already exists.' ].
	(StandardFileStream
		retryWithGC:
			[ self
				primRename: oldName asVmPathName
				to: newName asVmPathName ]
		until: [ : result | result notNil ]
		forFileNamed: oldName) ~~ nil ifTrue: [ ^ self ].
	^ self error: 'Failed to rename file'
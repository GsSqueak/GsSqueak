file operations
copyFile: fileStream1 toFile: fileStream2 
	| buffer |
	fileStream1 position: 0.
	fileStream2 truncate.
	buffer := String new: 50000.
	[ fileStream1 atEnd ] whileFalse: [ fileStream2 nextPutAll: (fileStream1 nextInto: buffer) ].
	fileStream2 position < fileStream1 size ifTrue: [ self error: 'File copy failed' ]
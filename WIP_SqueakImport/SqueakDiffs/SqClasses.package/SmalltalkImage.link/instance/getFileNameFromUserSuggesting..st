snapshot and quit
getFileNameFromUserSuggesting: aName
	"Ask the user for a new image name"
	| newName |
	newName := UIManager default
		saveFilenameRequest: 'Save Image as new name...' translated
		initialAnswer: aName.
	newName ifNil: [^nil].
	((FileDirectory default fileOrDirectoryExists: (self fullNameForImageNamed: newName)) or:
	 [FileDirectory default fileOrDirectoryExists: (self fullNameForChangesNamed: newName)]) ifTrue: [
		(self confirm: ('{1} already exists. Overwrite?' translated format: {newName})) ifFalse: [^nil]].
	^newName

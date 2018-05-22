accessing
localFileName: aString
	| dir entry parent fsPath |
	super localFileName: aString.
	fileName last = $/ ifFalse: [ fileName := fileName, '/' ].
	parent := FileDirectory default.
	aString last = parent pathNameDelimiter
		ifTrue: [fsPath := parent fullNameFor: aString]
		ifFalse: [fsPath := parent fullNameFor: aString, parent slash].
	(parent directoryExists: fsPath) ifTrue: [
		dir := FileDirectory on: fsPath.
		entry := dir directoryEntry.
		self setLastModFileDateTimeFrom: entry modificationTime
	]

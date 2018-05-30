file directory
asServerFileNamed: aName

	| rFile |
	rFile := self as: ServerFile.
	(aName includes: self pathNameDelimiter)
		ifTrue: [rFile fullPath: aName]
			"sets server, directory(path), fileName.  If relative, merge with self."
		ifFalse: [rFile fileName: aName].	"JUST a single NAME, already have the rest"
			"Mac files that include / in name, must encode it as %2F "
	^rFile

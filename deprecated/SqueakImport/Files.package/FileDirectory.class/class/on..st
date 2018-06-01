instance creation
on: pathString
	"Return a new file directory for the given path, of the appropriate FileDirectory subclass for the current OS platform."

	| pathName |
	DirectoryClass ifNil: [self setDefaultDirectoryClass].
	"If path ends with a delimiter (: or /) then remove it"
	pathName := pathString.
	(pathName at: pathName size ifAbsent: nil) = self pathNameDelimiter ifTrue:
		[pathName := pathName allButLast].
	DirectoryClass parentDirectoryNickname ifNotNil:
		[:parentName|
		(pathName beginsWith: parentName) ifTrue:
			[pathName = parentName ifTrue:
				[^self default containingDirectory].
			 (pathName at: parentName size + 1 ifAbsent: nil) = self pathNameDelimiter ifTrue:
				[^self default containingDirectory on: (pathName allButFirst: parentName size + 1)]]].
	^DirectoryClass new setPathName: pathName
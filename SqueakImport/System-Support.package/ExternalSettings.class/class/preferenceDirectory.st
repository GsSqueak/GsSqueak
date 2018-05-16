accessing
preferenceDirectory
	| prefDirName path |
	prefDirName := self preferenceDirectoryName.
	path := Smalltalk vmPath.
	^(FileDirectory default directoryExists: prefDirName)
		ifTrue: [FileDirectory default directoryNamed: prefDirName]
		ifFalse: [
			((FileDirectory on: path) directoryExists: prefDirName)
				ifTrue: [(FileDirectory on: path) directoryNamed: prefDirName]
				ifFalse: [nil]]

private
directoryContentsFor: fullPath do: aBlock
	"Evaluate aBlock with the directory entries for the files and directories in 
	the directory with the given path. See primLookupEntryIn:index: for 
	further details."
	"FileDirectory default directoryContentsFor: '' do: [ :each | Transcript show: each; cr ]"

	| extraPath extraPathFullName needsExtraPath |
	fullPath isNullPath ifFalse: [ ^super directoryContentsFor: fullPath do: aBlock ].

	"For Acorn we also make sure that at least the parent of the current dir 
	is added - sometimes this is in a filing system that has not been (or 
	cannot be) polled for disc root names"
	extraPath := self class default containingDirectory.
	extraPathFullName := extraPath fullName.
	needsExtraPath := true.
	super directoryContentsFor: fullPath do: [ :entry |
		needsExtraPath := needsExtraPath and: [ (extraPathFullName beginsWith: entry name) not ].
		aBlock value: entry ].

	needsExtraPath ifFalse: [ ^self ].
	"Only add the extra path if we haven't already got the root of the current dir in the list"
	aBlock value: (
		DirectoryEntryDirectory
			directory: self
			name: extraPathFullName
			creationTime: 0
			modificationTime: 0
			fileSize: 0)
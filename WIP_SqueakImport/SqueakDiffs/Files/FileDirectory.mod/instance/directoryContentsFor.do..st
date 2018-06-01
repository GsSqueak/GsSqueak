private
directoryContentsFor: fullPath do: aBlock
	"Do aBlock for the files and directories in the directory with the given path. See primLookupEntryIn:index: for further details."
	"FileDirectory default directoryContentsFor: '' do: [ :each | Transcript show: each; cr ]"

	| vmPath entryArray index |
	vmPath := fullPath asVmPathName.
	index := 1.
	entryArray := (self primLookupEntryIn: vmPath index: index) ifNil: [ ^self ].
	#badDirectoryPath == entryArray ifTrue: [
		^(InvalidDirectoryError pathName: fullPath) signal ].
	[
		aBlock value: (DirectoryEntry fromArray: entryArray directory: self) convertFromSystemName.
		entryArray := (self primLookupEntryIn: vmPath index: (index := index + 1)) ifNil: [ ^self ] ] repeat
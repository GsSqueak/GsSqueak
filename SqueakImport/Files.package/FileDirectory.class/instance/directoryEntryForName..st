private
directoryEntryForName: aFileName

	"Return a single DirectoryEntry for the given (non-path) entry name,
	 or nil if the entry could not be found.
	 Raises InvalidDirectoryError if this directory's path does not identify a directory."

	| entryArray sysPath sysName |

	sysPath := pathName asVmPathName.
	sysName := aFileName asVmPathName.

	"New linear-time primitive."
	entryArray := self primLookupEntryIn: sysPath name: sysName.
	entryArray == #primFailed ifFalse:[
		^ entryArray ifNotNil: [(DirectoryEntry fromArray: entryArray directory: self) convertFromSystemName]
	].

	"(InvalidDirectoryError pathName: pathName) signal.
	^nil"

	"If the new primitive fails, use the old slow method. 
	 (This fallback can be changed to signal InvalidDirectoryError once
	  VM's with FilePlugin #primitiveDirectoryEntry have been distributed everywhere;
	  the new primitive was introduced 6/13/2007."

	self isCaseSensitive 
		ifTrue: [ self entriesDo: [ :entry | entry name = aFileName ifTrue: [ ^entry ] ] ] 
		ifFalse: [ self entriesDo: [ :entry | (entry name sameAs: aFileName) ifTrue: [ ^entry ] ] ].
	^nil
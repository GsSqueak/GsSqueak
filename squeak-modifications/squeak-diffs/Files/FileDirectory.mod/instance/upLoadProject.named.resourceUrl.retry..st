file operations
upLoadProject: projectFile named: destinationFileName resourceUrl: resUrl retry: aBool
	"Copy the contents of the existing fileStream into the file destinationFileName in this directory.  fileStream can be anywhere in the fileSystem.  No retrying for local file systems."

	| result |
	result := self putFile: projectFile named: destinationFileName.
	[self
		setMacFileNamed: destinationFileName
		type: 'SOBJ'
		creator: 'FAST']
		on: Error
		do: [ "ignore" ].
	^result
toolbuilder
drop: aDirectoryEntryFile ontoDirectory: aFileDirectory shouldCopy: aBoolean 
	aDirectoryEntryFile containingDirectory = aFileDirectory
		ifTrue: [^ self].
	aBoolean
		ifTrue: [aFileDirectory copyHere: aDirectoryEntryFile]
		ifFalse: [directory
				rename: aDirectoryEntryFile fullName
				toBe: (aFileDirectory fullNameFor: aDirectoryEntryFile name).
			self setDirectoryTo: directory]
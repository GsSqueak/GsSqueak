menu building
directoryNamesString: aDirectory
"Answer a string concatenating the directory name strings in aDirectory, each string followed by a '[...]' indicator, and followed by a cr."

	^ String streamContents:
		[:s | aDirectory directoryNames do: 
				[:dn | s nextPutAll: dn withBlanksTrimmed , ' [...]'; cr]]


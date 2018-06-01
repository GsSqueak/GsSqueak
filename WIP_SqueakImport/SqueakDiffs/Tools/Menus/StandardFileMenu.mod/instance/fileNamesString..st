menu building
fileNamesString: aDirectory
"Answer a string concatenating the file name strings in aDirectory, each string followed by a cr."

	^String streamContents:
		[:s | 
			aDirectory fileNames do: 
				[:fn |
					pattern do:[:each | (each match: fn) ifTrue: [
						s nextPutAll: fn withBlanksTrimmed; cr]]]]
		
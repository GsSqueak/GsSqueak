menu building
pathPartsString: aDirectory
"Answer a string concatenating the path parts strings in aDirectory, each string followed by a cr."

	^String streamContents:
		[:s | 
			s nextPutAll: '[]'; cr.
			aDirectory pathParts asArray doWithIndex: 
				[:part :i |
					s next: i put: $ .
					s nextPutAll: part withBlanksTrimmed; cr]]
resultBlocks
pathNameResultBlock

	^[:theDirectory :theFileName | 
		theFileName 
			ifNil: [theDirectory pathName]
			ifNotNil: [theDirectory fullNameFor: theFileName]].

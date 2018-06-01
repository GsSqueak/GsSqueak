class creation
optionsForType: aSymbol
	
	(self byteTypes includes: aSymbol) ifFalse: [^ #()].
	^ self optionForElementSize: 2 ** ((self byteTypes indexOf: aSymbol) - 1)
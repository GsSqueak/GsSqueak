initialize
on: aFileName
	"Initialize the receiver from a file name"
	fileName := aFileName.
	self withFileDo:[:fontFile|
		(self findTable: 'head' in: fontFile) 
			ifFalse:[^self error: 'File does not have a header table'].
		self processFontHeaderTable: fontFile.
		(self findTable: 'maxp' in: fontFile) 
			ifFalse:[^self error: 'File does not have a profile table'].
		self processMaximumProfileTable: fontFile.
		(self findTable: 'name' in: fontFile) 
			ifFalse:[^self error: 'File does not have a naming table'].
		self processNamingTable: fontFile.
		(self findTable: 'hhea' in: fontFile) 
			ifFalse:[^self error: 'File does not have a horizontal header table'].
		self processHorizontalHeaderTable: fontFile.
		(self findTable: 'hmtx' in: fontFile) 
			ifFalse:[^self error: 'File does not have a horizontal header table'].
		hmtxTableOffset := fontFile position.
		(self findTable: 'loca' in: fontFile) 
			ifFalse:[^self error: 'File does not have a naming table'].
		indexToLocOffset := fontFile position.
		(self findTable: 'glyf' in: fontFile) 
			ifFalse:[^self error: 'File does not have a naming table'].
		glyphTableOffset := fontFile position.
		(self findTable: 'cmap' in: fontFile) 
			ifFalse:[^self error: 'File does not have a header table'].
		self processCharacterMappingTable: fontFile.
	].
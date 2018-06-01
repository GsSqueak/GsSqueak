initialize
on: aFileName offset: fontOffset 
	"Initialize the receiver from a file name"
	fileName := aFileName.
	fileOffset := fontOffset.
	self
		withFileDo: [:fontFile | 
			"Some TTC fonts may actually be collection of PostScript-Based
			OpenType fonts"
			(self findTable: 'CFF ' in: fontFile)
				ifTrue: [^ nil]
				ifFalse: [fontFile position: fileOffset
					"reset"].
			"Some bitmap fonts are called .ttf; skip anything that doesn't
			have a header"
			(self findTable: 'head' in: fontFile)
				ifFalse: [^ nil].
			self processFontHeaderTable: fontFile.
			(self findTable: 'maxp' in: fontFile)
				ifFalse: [^ self error: 'File does not have a profile table'].
			self processMaximumProfileTable: fontFile.
			(self findTable: 'name' in: fontFile)
				ifFalse: [^ self error: 'File does not have a naming table'].
			self processNamingTable: fontFile.
			(self findTable: 'hhea' in: fontFile)
				ifFalse: [^ self error: 'File does not have a horizontal header table'].
			self processHorizontalHeaderTable: fontFile.
			(self findTable: 'OS/2' in: fontFile)
				ifTrue: [self processOS2Table: fontFile].
			(self findTable: 'hmtx' in: fontFile)
				ifFalse: [^ self error: 'File does not have a horizontal header table'].
			hmtxTableOffset := fontFile position.
			(self findTable: 'loca' in: fontFile)
				ifFalse: [^ self error: 'File does not have a naming table'].
			indexToLocOffset := fontFile position.
			(self findTable: 'glyf' in: fontFile)
				ifFalse: [^ self error: 'File does not have a naming table'].
			glyphTableOffset := fontFile position.
			(self findTable: 'cmap' in: fontFile)
				ifFalse: [^ self error: 'File does not have a header table'].
			self processCharacterMappingTable: fontFile]
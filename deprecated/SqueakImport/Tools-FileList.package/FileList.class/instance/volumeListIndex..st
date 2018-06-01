volume list and pattern
volumeListIndex: index
	"Select the volume name having the given index."

	| delim path |
	volListIndex := index.
	index = 1 
		ifTrue: [self directory: (FileDirectory on: '')]
		ifFalse: [delim := directory pathNameDelimiter.
				path := String streamContents: [:strm |
					2 to: index do: [:i |
						strm nextPutAll: (volList at: i) withBlanksTrimmed.
						i < index ifTrue: [strm nextPut: delim]]].
				self directory: (directory on: path)].
	brevityState := #FileList.
	self addPath: path.
	self changed: #fileList.
	self changed: #contents.
	self updateButtonRow.
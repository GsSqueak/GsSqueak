volume list and pattern
volumeListIndex: index 
	"Select the volume name having the given index."
	| _gsSqueakTemp_delim _gsSqueakTemp_path |
	volListIndex := index.
	index = 1
		ifTrue: [self
				directory: (FileDirectory on: '')]
		ifFalse: [_gsSqueakTemp_delim := directory pathNameDelimiter.
			_gsSqueakTemp_path := String
						streamContents: [:strm | 2
								to: index
								do: [:i | 
									strm nextPutAll: (volList at: i) withBlanksTrimmed.
									i < index
										ifTrue: [strm nextPut: _gsSqueakTemp_delim]]].
			self
				directory: (directory on: _gsSqueakTemp_path)].
	brevityState := #FileList.
	self addPath: _gsSqueakTemp_path.
	self changed: #fileList.
	self changed: #contents.
	self updateButtonRow
image save/restore
writeImageFileIOSimulation
	"Write the image header and heap contents to imageFile for snapshot.
	c.f. writeImageFileIO. The game below is to maintain 64-bit alignment
	for all putLong:toFile: occurrences."
	| _gsSqueakTemp_headerSize _gsSqueakTemp_file |
	_gsSqueakTemp_headerSize := objectMemory wordSize = 4
				ifTrue: [64]
				ifFalse: [128].
	(_gsSqueakTemp_file := FileStream fileNamed: self imageName)
		ifNil: [self primitiveFail.
			^ nil].
	[_gsSqueakTemp_file binary.
	self putWord32: self imageFormatVersion toFile: _gsSqueakTemp_file.
	self putWord32: _gsSqueakTemp_headerSize toFile: _gsSqueakTemp_file.
	{objectMemory imageSizeToWrite. objectMemory baseAddressOfImage. objectMemory specialObjectsOop. objectMemory lastHash. self ioScreenSize. self getImageHeaderFlags}
		do: [:long | self putLong: long toFile: _gsSqueakTemp_file].
	self
		putWord32: (extraVMMemory
				ifNil: [0])
		toFile: _gsSqueakTemp_file.
	{desiredNumStackPages. self unknownShortOrCodeSizeInKs}
		do: [:short | self putShort: short toFile: _gsSqueakTemp_file].
	self putWord32: desiredEdenBytes toFile: _gsSqueakTemp_file.
	{maxExtSemTabSizeSet
		ifTrue: [self ioGetMaxExtSemTableSize]
		ifFalse: [0]. 0}
		do: [:short | self putShort: short toFile: _gsSqueakTemp_file].
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [| bytesWritten |
			self putLong: objectMemory firstSegmentBytes toFile: _gsSqueakTemp_file.
			self putLong: objectMemory bytesLeftInOldSpace toFile: _gsSqueakTemp_file.
			2
				timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_file
					"Pad the rest of the header."].
			objectMemory wordSize = 8
				ifTrue: [3
						timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_file]].
			self assert: _gsSqueakTemp_file position = _gsSqueakTemp_headerSize.
			"Position the file after the header."
			_gsSqueakTemp_file position: _gsSqueakTemp_headerSize.
			bytesWritten := objectMemory writeImageSegmentsToFile: _gsSqueakTemp_file.
			self assert: bytesWritten = objectMemory imageSizeToWrite]
		ifFalse: ["Pad the rest of the header."
			4
				timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_file].
			objectMemory wordSize = 8
				ifTrue: [3
						timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_file]].
			self assert: _gsSqueakTemp_file position = _gsSqueakTemp_headerSize.
			"Position the file after the header."
			_gsSqueakTemp_file position: _gsSqueakTemp_headerSize.
			"Write the object memory."
			objectMemory baseAddressOfImage // 4 + 1
				to: objectMemory baseAddressOfImage + objectMemory imageSizeToWrite // 4
				do: [:index | self
						putLong: (objectMemory memory at: index)
						toFile: _gsSqueakTemp_file]].
	self success: true]
		ensure: [_gsSqueakTemp_file
				ifNotNil: [_gsSqueakTemp_file close]]
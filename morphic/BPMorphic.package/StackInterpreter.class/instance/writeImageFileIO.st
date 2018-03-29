image save/restore
writeImageFileIO
	"Write the image header and heap contents to imageFile for snapshot.
	c.f. writeImageFileIOSimulation.
	The game below is to maintain 64-bit alignment for all putLong:toFile:
	occurrences. "
	| _gsSqueakTemp_imageName _gsSqueakTemp_headerStart _gsSqueakTemp_headerSize _gsSqueakTemp_f _gsSqueakTemp_imageBytes _gsSqueakTemp_bytesWritten _gsSqueakTemp_sCWIfn _gsSqueakTemp_okToWrite |
	self
		cCode: []
		inSmalltalk: [_gsSqueakTemp_imageName := 'sooth compiler'.
			^ self writeImageFileIOSimulation].
	"If the security plugin can be loaded, use it to check for write
	permission. If not, assume it's ok"
	_gsSqueakTemp_sCWIfn := self ioLoadFunction: 'secCanWriteImage' From: 'SecurityPlugin'.
	_gsSqueakTemp_sCWIfn ~= 0
		ifTrue: [_gsSqueakTemp_okToWrite := self cCode: '((sqInt (*)(void))sCWIfn)()'.
			_gsSqueakTemp_okToWrite
				ifFalse: [^ self primitiveFail]].
	"local constants"
	_gsSqueakTemp_headerStart := 0.
	_gsSqueakTemp_headerSize := objectMemory wordSize = 4
				ifTrue: [64]
				ifFalse: [128].
	"header size in bytes; do not change!"
	_gsSqueakTemp_f := self sqImageFile: _gsSqueakTemp_imageName Open: 'wb'.
	_gsSqueakTemp_f = nil
		ifTrue: ["could not open the image file for writing"
			^ self primitiveFail].
	_gsSqueakTemp_imageBytes := objectMemory imageSizeToWrite.
	_gsSqueakTemp_headerStart := self
				sqImage: _gsSqueakTemp_f
				File: _gsSqueakTemp_imageName
				StartLocation: _gsSqueakTemp_headerSize + _gsSqueakTemp_imageBytes.
	self cCode: '/* Note: on Unix systems one could put an exec command here, padded to 512 bytes */'.
	"position file to start of header"
	self sqImageFile: _gsSqueakTemp_f Seek: _gsSqueakTemp_headerStart.
	self putWord32: self imageFormatVersion toFile: _gsSqueakTemp_f.
	self putWord32: _gsSqueakTemp_headerSize toFile: _gsSqueakTemp_f.
	self putLong: _gsSqueakTemp_imageBytes toFile: _gsSqueakTemp_f.
	self putLong: objectMemory baseAddressOfImage toFile: _gsSqueakTemp_f.
	self putLong: objectMemory specialObjectsOop toFile: _gsSqueakTemp_f.
	self putLong: objectMemory newObjectHash toFile: _gsSqueakTemp_f.
	self putLong: self getSnapshotScreenSize toFile: _gsSqueakTemp_f.
	self putLong: self getImageHeaderFlags toFile: _gsSqueakTemp_f.
	self putWord32: extraVMMemory toFile: _gsSqueakTemp_f.
	self putShort: desiredNumStackPages toFile: _gsSqueakTemp_f.
	self putShort: self unknownShortOrCodeSizeInKs toFile: _gsSqueakTemp_f.
	self putWord32: desiredEdenBytes toFile: _gsSqueakTemp_f.
	self
		putShort: (maxExtSemTabSizeSet
				ifTrue: [self ioGetMaxExtSemTableSize]
				ifFalse: [0])
		toFile: _gsSqueakTemp_f.
	self putShort: the2ndUnknownShort toFile: _gsSqueakTemp_f.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [self putLong: objectMemory firstSegmentBytes toFile: _gsSqueakTemp_f.
			self putLong: objectMemory bytesLeftInOldSpace toFile: _gsSqueakTemp_f.
			2
				timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_f
					"Pad the rest of the header."]]
		ifFalse: [4
				timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_f]].
	"Pad the rest of the header."
	objectMemory wordSize = 8
		ifTrue: [3
				timesRepeat: [self putLong: 0 toFile: _gsSqueakTemp_f]].
	"Pad the rest of the header."
	self assert: _gsSqueakTemp_headerStart + _gsSqueakTemp_headerSize
			= (self sqImageFilePosition: _gsSqueakTemp_f).
	"position file after the header"
	self sqImageFile: _gsSqueakTemp_f Seek: _gsSqueakTemp_headerStart + _gsSqueakTemp_headerSize.
	self successful
		ifFalse: ["file write or seek failure"
			self sqImageFileClose: _gsSqueakTemp_f.
			^ nil].
	"write the image data"
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_bytesWritten := objectMemory writeImageSegmentsToFile: _gsSqueakTemp_f]
		ifFalse: [_gsSqueakTemp_bytesWritten := self
						sq: (self pointerForOop: objectMemory baseAddressOfImage)
						Image: (self sizeof: #char)
						File: _gsSqueakTemp_imageBytes
						Write: _gsSqueakTemp_f].
	self success: _gsSqueakTemp_bytesWritten = _gsSqueakTemp_imageBytes.
	self sqImageFileClose: _gsSqueakTemp_f
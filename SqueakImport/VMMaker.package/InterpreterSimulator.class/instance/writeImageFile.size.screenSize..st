image save/restore
writeImageFile: file size: numberOfBytesToWrite screenSize: screenSize
	"Actually emit the first numberOfBytesToWrite object memory bytes onto the snapshot."

	| headerSize |
	objectMemory bytesPerWord = 4 ifFalse: [self error: 'Not rewritten for 64 bits yet'].
	headerSize := 16 * objectMemory bytesPerWord.

	{
		self imageFormatVersion.
		headerSize.
		numberOfBytesToWrite.
		objectMemory startOfMemory.
		objectMemory getSpecialObjectsOop.
		objectMemory getLastHash.
		screenSize.
		fullScreenFlag.
		extraVMMemory
	}
		do: [:long | self putLong: long toFile: file].
	
	"Pad the rest of the header."
	7 timesRepeat: [self putLong: 0 toFile: file].
	
	"Position the file after the header."
	file position: headerSize.

	"Write the object memory."
	1 to: numberOfBytesToWrite // 4
		do: [:index |
			self
				putLong: (objectMemory getMemory at: index)
				toFile: file].

	self success: true

image save/restore
readImageFromFile: f HeapSize: desiredHeapSize StartingAt: imageOffset 
	"Read an image from the given file stream, allocating an amount of
	memory to its object heap.
	
	V3: desiredHeapSize is the total size of the heap. Fail if the image has
	an unknown format or
	requires more than the specified amount of memory.
	
	Spur: desiredHeapSize is ignored; this routine will attempt to provide
	at least extraVMMemory's
	ammount of free space after the image is loaded, taking any free
	space in teh image into account.
	extraVMMemory is stored in the image header and is accessible as
	vmParameterAt: 23. If
	extraVMMemory is 0, the value defaults to the default grow
	headroom. Fail if the image has an
	unknown format or if sufficient memory cannot be allocated.
	
	Details: This method detects when the image was stored on a
	machine with the opposite byte
	ordering from this machine and swaps the bytes automatically.
	Furthermore, it allows the header
	information to start 512 bytes into the file, since some file transfer
	programs for the Macintosh
	apparently prepend a Mac-specific header of this size. Note that this
	same 512 bytes of prefix
	area could also be used to store an exec command on Unix systems,
	allowing one to launch
	Smalltalk by invoking the image name as a command."
	| _gsSqueakTemp_headerStart _gsSqueakTemp_headerSize _gsSqueakTemp_headerFlags _gsSqueakTemp_dataSize _gsSqueakTemp_oldBaseAddr _gsSqueakTemp_swapBytes _gsSqueakTemp_minimumMemory _gsSqueakTemp_bytesRead _gsSqueakTemp_bytesToShift _gsSqueakTemp_heapSize _gsSqueakTemp_firstSegSize _gsSqueakTemp_hdrEdenBytes _gsSqueakTemp_hdrMaxExtSemTabSize _gsSqueakTemp_hdrNumStackPages _gsSqueakTemp_allocationReserve |
	metaclassNumSlots := 6.
	"guess Metaclass instSize"
	classNameIndex := 6.
	"guess (Class instVarIndexFor: 'name' ifAbsent: []) - 1"
	_gsSqueakTemp_swapBytes := self checkImageVersionFrom: f startingAt: imageOffset.
	_gsSqueakTemp_headerStart := (self sqImageFilePosition: f)
				- 4.
	"record header start position"
	_gsSqueakTemp_headerSize := self getWord32FromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_dataSize := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_oldBaseAddr := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
	objectMemory
		specialObjectsOop: (self getLongFromFile: f swap: _gsSqueakTemp_swapBytes).
	objectMemory
		lastHash: (self getLongFromFile: f swap: _gsSqueakTemp_swapBytes).
	"N.B. not used."
	savedWindowSize := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_headerFlags := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
	self setImageHeaderFlagsFrom: _gsSqueakTemp_headerFlags.
	extraVMMemory := self getWord32FromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_hdrNumStackPages := self getShortFromFile: f swap: _gsSqueakTemp_swapBytes.
	"4 stack pages is small. Should be able to run with as few as
	three. 4 should be comfortable but slow. 8 is a reasonable
	default. Can be changed via vmParameterAt: 43 put: n.
	Can be set as a preference (Info.plist, VM.ini, command line etc).
	If desiredNumStackPages is already non-zero then it has been
	set as a preference. Ignore (but preserve) the header's default."
	numStackPages := desiredNumStackPages ~= 0
				ifTrue: [desiredNumStackPages]
				ifFalse: [_gsSqueakTemp_hdrNumStackPages = 0
						ifTrue: [self defaultNumStackPages]
						ifFalse: [_gsSqueakTemp_hdrNumStackPages]].
	desiredNumStackPages := _gsSqueakTemp_hdrNumStackPages.
	"pad to word boundary. This slot can be used for anything else that
	will fit in 16 bits.
	It is used for the cog code size in Cog. Preserve it to be polite to other
	VMs. "
	theUnknownShort := self getShortFromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_hdrEdenBytes := self getWord32FromFile: f swap: _gsSqueakTemp_swapBytes.
	objectMemory
		edenBytes: (desiredEdenBytes ~= 0
				ifTrue: [desiredEdenBytes]
				ifFalse: [_gsSqueakTemp_hdrEdenBytes = 0
						ifTrue: [objectMemory defaultEdenBytes]
						ifFalse: [_gsSqueakTemp_hdrEdenBytes]]).
	desiredEdenBytes := _gsSqueakTemp_hdrEdenBytes.
	_gsSqueakTemp_hdrMaxExtSemTabSize := self getShortFromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_hdrMaxExtSemTabSize ~= 0
		ifTrue: [self setMaxExtSemSizeTo: _gsSqueakTemp_hdrMaxExtSemTabSize].
	"pad to word boundary. This slot can be used for anything else that
	will fit in 16 bits.
	Preserve it to be polite to other VMs."
	the2ndUnknownShort := self getShortFromFile: f swap: _gsSqueakTemp_swapBytes.
	_gsSqueakTemp_firstSegSize := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
	objectMemory firstSegmentSize: _gsSqueakTemp_firstSegSize.
	"compare memory requirements with availability"
	_gsSqueakTemp_allocationReserve := self interpreterAllocationReserveBytes.
	_gsSqueakTemp_minimumMemory := _gsSqueakTemp_dataSize + objectMemory newSpaceBytes + _gsSqueakTemp_allocationReserve.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [| freeOldSpaceInImage headroom |
			freeOldSpaceInImage := self getLongFromFile: f swap: _gsSqueakTemp_swapBytes.
			headroom := objectMemory initialHeadroom: extraVMMemory givenFreeOldSpaceInImage: freeOldSpaceInImage.
			_gsSqueakTemp_heapSize := objectMemory roundUpHeapSize: _gsSqueakTemp_dataSize + headroom + objectMemory newSpaceBytes
							+ (headroom > _gsSqueakTemp_allocationReserve
									ifTrue: [0]
									ifFalse: [_gsSqueakTemp_allocationReserve])]
		ifFalse: [_gsSqueakTemp_heapSize := desiredHeapSize + objectMemory newSpaceBytes
						+ (desiredHeapSize - _gsSqueakTemp_dataSize > _gsSqueakTemp_allocationReserve
								ifTrue: [0]
								ifFalse: [_gsSqueakTemp_allocationReserve]).
			_gsSqueakTemp_heapSize < _gsSqueakTemp_minimumMemory
				ifTrue: [self insufficientMemorySpecifiedError]].
	"allocate a contiguous block of memory for the Squeak heap"
	objectMemory memory: (self
			allocateMemory: _gsSqueakTemp_heapSize
			minimum: _gsSqueakTemp_minimumMemory
			imageFile: f
			headerSize: _gsSqueakTemp_headerSize) asUnsignedInteger.
	objectMemory memory
		ifNil: [self insufficientMemoryAvailableError].
	objectMemory
		setHeapBase: objectMemory memory
		memoryLimit: objectMemory memory + _gsSqueakTemp_heapSize
		endOfMemory: objectMemory memory + _gsSqueakTemp_dataSize.
	"position file after the header"
	self sqImageFile: f Seek: _gsSqueakTemp_headerStart + _gsSqueakTemp_headerSize.
	"read in the image in bulk, then swap the bytes if necessary"
	_gsSqueakTemp_bytesRead := objectMemory readHeapFromImageFile: f dataBytes: _gsSqueakTemp_dataSize.
	_gsSqueakTemp_bytesRead ~= _gsSqueakTemp_dataSize
		ifTrue: [self unableToReadImageError].
	self ensureImageFormatIsUpToDate: _gsSqueakTemp_swapBytes.
	"compute difference between old and new memory base addresses"
	_gsSqueakTemp_bytesToShift := objectMemory memoryBaseForImageRead - _gsSqueakTemp_oldBaseAddr.
	self initializeInterpreter: _gsSqueakTemp_bytesToShift.
	"adjusts all oops to new location"
	^ _gsSqueakTemp_dataSize
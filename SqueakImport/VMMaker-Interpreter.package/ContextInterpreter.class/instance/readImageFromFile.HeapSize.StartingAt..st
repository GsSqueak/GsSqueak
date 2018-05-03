image save/restore
readImageFromFile: f HeapSize: desiredHeapSize StartingAt: imageOffset
	"Read an image from the given file stream, allocating the given amount of memory to its object heap. Fail if the image has an unknown format or requires more than the given amount of memory."
	"Details: This method detects when the image was stored on a machine with the opposite byte ordering from this machine and swaps the bytes automatically. Furthermore, it allows the header information to start 512 bytes into the file, since some file transfer programs for the Macintosh apparently prepend a Mac-specific header of this size. Note that this same 512 bytes of prefix area could also be used to store an exec command on Unix systems, allowing one to launch Smalltalk by invoking the image name as a command."
	"This code is based on C code by Ian Piumarta and Smalltalk code by Tim Rowledge. Many thanks to both of you!!"

	| swapBytes headerStart headerSize dataSize oldBaseAddr minimumMemory memStart bytesRead bytesToShift heapSize |
	<var: #f type: 'sqImageFile '>
	<var: #desiredHeapSize type: 'usqInt'>
	<var: #headerStart type: 'squeakFileOffsetType '>
	<var: #dataSize type: 'size_t '>
	<var: #imageOffset type: 'squeakFileOffsetType '>

	swapBytes := self checkImageVersionFrom: f startingAt: imageOffset.
	headerStart := (self sqImageFilePosition: f) - objectMemory bytesPerWord.  "record header start position"

	headerSize			:= self getLongFromFile: f swap: swapBytes.
	dataSize			:= self getLongFromFile: f swap: swapBytes.
	oldBaseAddr		:= self getLongFromFile: f swap: swapBytes.
	objectMemory setSpecialObjectsOop: (self getLongFromFile: f swap: swapBytes).
	objectMemory setLastHash: (self getLongFromFile: f swap: swapBytes).
	savedWindowSize	:= self getLongFromFile: f swap: swapBytes.
	fullScreenFlag		:= self oldFormatFullScreenFlag: (self getLongFromFile: f swap: swapBytes).
	extraVMMemory	:= self getLongFromFile: f swap: swapBytes.

	objectMemory getLastHash = 0 ifTrue: [
		"lastHash wasn't stored (e.g. by the cloner); use 999 as the seed"
		objectMemory setLastHash: 999].

	"decrease Squeak object heap to leave extra memory for the VM"
	heapSize := self cCode: 'reserveExtraCHeapBytes(desiredHeapSize, extraVMMemory)'.

	"compare memory requirements with availability".
	minimumMemory := dataSize + 100000.  "need at least 100K of breathing room"
	heapSize < minimumMemory ifTrue: [
		self insufficientMemorySpecifiedError].

	"allocate a contiguous block of memory for the Squeak heap"
	(objectMemory allocateMemory: heapSize
		minimum: minimumMemory
		imageFile: f
		headerSize: headerSize) = nil ifTrue: [self insufficientMemoryAvailableError].

	memStart := objectMemory startOfMemory.
	objectMemory setMemoryLimit: (memStart + heapSize) - 24.  "decrease memoryLimit a tad for safety"
	objectMemory setEndOfMemory: memStart + dataSize.

	"position file after the header"
	self sqImageFile: f Seek: headerStart + headerSize.

	"read in the image in bulk, then swap the bytes if necessary"
	bytesRead := self
		sqImage: (objectMemory pointerForOop: objectMemory getMemory)
		read: f
		size: (self cCode: 'sizeof(unsigned char)')
		length: dataSize.
	bytesRead ~= dataSize ifTrue: [self unableToReadImageError].

	objectMemory headerTypeBytesAt: 0 put: objectMemory bytesPerWord * 2.	"3-word header (type 0)"	
	objectMemory headerTypeBytesAt: 1 put: objectMemory bytesPerWord.		"2-word header (type 1)"
	objectMemory headerTypeBytesAt: 2 put: 0.					"free chunk (type 2)"	
	objectMemory headerTypeBytesAt: 3 put: 0.					"1-word header (type 3)"

	swapBytes ifTrue: [self reverseBytesInImage].

	"compute difference between old and new memory base addresses"
	bytesToShift := memStart - oldBaseAddr.
	self initializeInterpreter: bytesToShift.  "adjusts all oops to new location"
	self isBigEnder. "work out the machine endianness and cache the answer"
	
	(self initialImageFormatVersion bitAnd: 1) = 1
		ifTrue: ["Low order bit set, indicating that the image was saved from
			a StackInterpreter (Cog) VM. Storage of all Float objects must be
			returned to older object memory format."
			self normalizeFloatOrderingInImage].
 
	^ dataSize

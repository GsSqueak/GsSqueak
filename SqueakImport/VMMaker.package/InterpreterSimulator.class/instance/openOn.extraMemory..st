initialization
openOn: fileName extraMemory: extraBytes
	"InterpreterSimulator new openOn: 'clone.im' extraMemory: 100000"

	| f headerSize count oldBaseAddr bytesToShift swapBytes hasPlatformFloatOrdering |
	"open image file and read the header"

	["begin ensure block..."
	f := FileStream readOnlyFileNamed: fileName.
	imageName := f fullName.
	f binary.

	swapBytes := self checkImageVersionFrom: f startingAt: 0.
	"This interpreter does not use native float word order. Clear bit 1of format number."
	imageFormatVersionNumber := imageFormatInitialVersion bitAnd: -2.
	"If bit 1 was set set in the image file header, float word order must be normalized."
	hasPlatformFloatOrdering := (imageFormatInitialVersion bitAnd: 1) = 1.

	headerSize := self nextLongFrom: f swap: swapBytes.
	objectMemory setEndOfMemory: (self nextLongFrom: f swap: swapBytes).  "first unused location in heap"
	oldBaseAddr := self nextLongFrom: f swap: swapBytes.  "object memory base address of image"
	objectMemory setSpecialObjectsOop: (self nextLongFrom: f swap: swapBytes).
	objectMemory setLastHash: (self nextLongFrom: f swap: swapBytes).  "Should be loaded from, and saved to the image header"
	objectMemory getLastHash = 0 ifTrue: [objectMemory setLastHash: 999].

	savedWindowSize	:= self nextLongFrom: f swap: swapBytes.
	fullScreenFlag		:= self oldFormatFullScreenFlag: (self nextLongFrom: f swap: swapBytes).
	extraVMMemory		:= self nextLongFrom: f swap: swapBytes.

	"allocate interpreter memory"
	objectMemory setMemoryLimit: (objectMemory getEndOfMemory + extraBytes).

	"read in the image in bulk, then swap the bytes if necessary"
	f position: headerSize.
	objectMemory setMemory: (Bitmap new: objectMemory getMemoryLimit // 4).
	count := f readInto: objectMemory getMemory startingAt: 1 count: objectMemory getEndOfMemory // 4.
	count ~= (objectMemory getEndOfMemory // 4) ifTrue: [self halt].
	]
		ensure: [f close].

	swapBytes ifTrue: [Utilities informUser: 'Swapping bytes of foreign image...'
								during: [self reverseBytesInImage]].
	self initialize.
	bytesToShift := 0 - oldBaseAddr.  "adjust pointers for zero base address"
	objectMemory setEndOfMemory: objectMemory getEndOfMemory.
	Utilities informUser: 'Relocating object pointers...'
				during: [self initializeInterpreter: bytesToShift].

	hasPlatformFloatOrdering ifTrue: [
		"Low order bit set, indicating that the image was saved from
		a StackInterpreter (Cog) VM. Storage of all Float objects must be
		returned to older object memory format."
		Utilities informUser: 'Swapping words in float objects...'
				during: [self normalizeFloatOrderingInImage]].

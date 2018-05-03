stack pages
interpreterAllocationReserveBytes
	"At a rough approximation we may need to allocate up to a couple
	 of page's worth of contexts when switching stack pages, assigning
	 to senders, etc.  But the snapshot primitive voids all stack pages.
	 So a safe margin is the size of a large context times the maximum
	 number of frames per page times the number of pages."
	| availableBytesPerPage maxFramesPerPage |
	availableBytesPerPage := self stackPageByteSize - self stackLimitOffset - self stackPageHeadroom.
	maxFramesPerPage := availableBytesPerPage / objectMemory bytesPerWord // FrameSlots.
	^2 raisedTo: (maxFramesPerPage * LargeContextSize * numStackPages) highBit
interpreter access
storePointerUnchecked: fieldIndex ofObject: oop withValue: valuePointer
	"Like storePointer:ofObject:withValue:, but the caller guarantees that the object being stored into is a young object or is already marked as a root."

	^ self longAt: oop + self baseHeaderSize + (fieldIndex << self shiftForWord)
			put: valuePointer

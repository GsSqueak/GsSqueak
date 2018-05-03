allocation
shorten: obj toIndexableSize: nSlots
	"Reduce the number if indexable fields in obj, a pointer object, to nSlots. Convert the
	unused residual to a free chunk. Word and byte indexable objects are not changed.
	Answer the number of bytes returned to free memory, which may be zero if no change
	was possible."
	| deltaBytes desiredLength fixedFields fmt hdr totalLength
	 indexableFields |
	(self isPointersNonInt: obj) ifFalse: [^0].
	nSlots >  0
		ifFalse: [^0]. "no change if nSlots is zero, error if nSlots is negative"
	hdr := self baseHeader: obj.
	fmt := self formatOfHeader: hdr.
	totalLength := self lengthOf: obj baseHeader: hdr format: fmt.
	fixedFields := self fixedFieldsOf: obj format: fmt length: totalLength.
	indexableFields := totalLength - fixedFields.
	nSlots >= indexableFields
		ifTrue: [^0]. "no change, or error if attempting to increase size into next chunk"
	desiredLength := fixedFields + nSlots.		
	deltaBytes := (totalLength - desiredLength) * self bytesPerWord.
	obj + self baseHeaderSize + (totalLength * self bytesPerWord) = freeStart
		ifTrue: "Shortening the last object.  Need to reduce freeStart."
			[self maybeFillWithAllocationCheckFillerFrom: obj + self baseHeaderSize + (desiredLength * self bytesPerWord) to: freeStart.
			freeStart := obj + self baseHeaderSize + (desiredLength * self bytesPerWord)]
		ifFalse: "Shortening some interior object.  Need to create a free block."
			[self setSizeOfFree: obj + self baseHeaderSize + (desiredLength * self bytesPerWord)
				to: deltaBytes].
	(self headerType: obj) caseOf:	{
		[HeaderTypeSizeAndClass] ->
			[self longAt: (obj - (self baseHeaderSize * 2)) put: (self sizeHeader: obj) - deltaBytes].
		[HeaderTypeClass] ->
			[self longAt: obj put: ((hdr bitClear: self sizeMask) bitOr: (hdr bitAnd: self sizeMask) - deltaBytes)].
		[HeaderTypeShort] ->
			[self longAt: obj put: ((hdr bitClear: self sizeMask) bitOr: (hdr bitAnd: self sizeMask) - deltaBytes)] }.
	^deltaBytes
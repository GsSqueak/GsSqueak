indexing primitive support
lengthOf: oop baseHeader: hdr format: fmt
	"Return the number of fixed and indexable bytes, words, or object pointers in the
	given object. Assume the given oop is not an integer. For a CompiledMethod, the size
	of the method header (in bytes) should be subtracted from the result of this method."

	| sz |
	<inline: true>
	<asmLabel: false> 
	(hdr bitAnd: TypeMask) = HeaderTypeSizeAndClass
		ifTrue: [ sz := (self sizeHeader: oop) bitAnd: self longSizeMask ]
		ifFalse: [ sz := (hdr bitAnd: self sizeMask)].
	sz := sz - (hdr bitAnd: self size4Bit).
	fmt <= 4
		ifTrue: [ ^ (sz - self baseHeaderSize) >> self shiftForWord "words"].
	fmt < 8
		ifTrue: [ ^ (sz - self baseHeaderSize) >> 2 "32-bit longs"]
		ifFalse: [ ^ (sz - self baseHeaderSize) - (fmt bitAnd: 3) "bytes"]
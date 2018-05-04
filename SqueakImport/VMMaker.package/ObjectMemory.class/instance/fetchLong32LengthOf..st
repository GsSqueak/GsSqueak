interpreter access
fetchLong32LengthOf: objectPointer
	"Gives size appropriate for, eg, fetchLong32"

	| sz |
	sz := self sizeBitsOf: objectPointer.
	^ (sz - self baseHeaderSize) >> 2
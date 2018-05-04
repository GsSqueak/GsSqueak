allocation
sufficientSpaceToAllocate: bytes
	"Return true if there is enough space to allocate the given number of bytes, perhaps after doing a garbage collection."

	| minFree |
	<inline: true>
	minFree := (lowSpaceThreshold + bytes + self baseHeaderSize + self bytesPerWord - 1) bitAnd: (self bytesPerWord - 1) bitInvert32.

	"check for low-space"
	(self oop: freeStart + minFree isLessThanOrEqualTo: reserveStart) ifTrue:
		[^true].
	^self sufficientSpaceAfterGC: minFree
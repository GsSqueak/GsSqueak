allocation
sufficientSpaceToAllocate: bytes
	"Return true if there is enough space to allocate the given number of bytes,
	perhaps after doing a garbage collection. Sender is responsible for ensuring
	that requested size does result in arithmetic overflow, see note below."

	| minFree |
	<inline: true>
	<var: #bytes type: 'usqInt'>
	<var: #minFree type: 'usqInt'>

	"Note: Arithmetic overflow may occur in calculation of minFree (indicated by
	minFree < bytes after calculation of minFree). The check is performed by sender
	to avoid redundant test here."
	minFree := lowSpaceThreshold + bytes + self baseHeaderSize.

	"check for low-space"
	(self oop: (self sizeOfFree: freeBlock) isGreaterThanOrEqualTo: minFree)
		ifTrue: [^true]
		ifFalse: [^self sufficientSpaceAfterGC: minFree].
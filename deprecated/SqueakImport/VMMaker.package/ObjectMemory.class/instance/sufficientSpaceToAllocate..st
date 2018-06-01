allocation
sufficientSpaceToAllocate: bytes
	"Return true if there is enough space to allocate the given number of bytes,
	perhaps after doing a garbage collection. Sender is responsible for ensuring
	that requested size does result in arithmetic overflow, see note below."
	self subclassResponsibility
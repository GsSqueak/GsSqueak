allocation
shorten: obj toIndexableSize: nSlots
	"Reduce the number if indexable fields in obj, a pointer object, to nSlots. Convert the
	unused residual to a free chunk. Word and byte indexable objects are not changed.
	Answer the number of bytes returned to free memory, which may be zero if no change
	was possible."

	self subclassResponsibility
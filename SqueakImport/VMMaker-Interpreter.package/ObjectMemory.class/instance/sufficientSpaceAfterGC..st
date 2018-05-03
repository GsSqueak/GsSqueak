allocation
sufficientSpaceAfterGC: minFree 
	"Return true if there is enough free space after doing a garbage collection. If not, signal that space is low."
	self subclassResponsibility
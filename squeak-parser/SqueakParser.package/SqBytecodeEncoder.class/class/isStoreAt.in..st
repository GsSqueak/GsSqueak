instruction stream support
isStoreAt: pc in: method 
	"Answer whether the bytecode at pc is a store or store-pop."
	self subclassResponsibility
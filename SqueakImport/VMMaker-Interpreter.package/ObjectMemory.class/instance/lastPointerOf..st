object enumeration
lastPointerOf: oop 
	"Return the byte offset of the last pointer field of the given object.  
	Works with CompiledMethods, as well as ordinary objects. 
	Can be used even when the type bits are not correct."
	self subclassResponsibility
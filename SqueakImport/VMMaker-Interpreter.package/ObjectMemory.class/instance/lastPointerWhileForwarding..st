gc -- compaction
lastPointerWhileForwarding: oop 
	"The given object may have its header word in a forwarding block. Find  
	the offset of the last pointer in the object in spite of this obstacle. "
	self subclassResponsibility
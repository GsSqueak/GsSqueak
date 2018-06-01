gc -- compaction
initForwardBlock: fwdBlock mapping: oop to: newOop withBackPtr: backFlag 
	"Initialize the given forwarding block to map oop to newOop, 
	and replace oop's header with a pointer to the fowarding block. "
	self subclassResponsibility
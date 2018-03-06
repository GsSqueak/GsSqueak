instruction stream support
isSendAt: pc in: method 
	"Answer whether the bytecode at pc is a message-send."
	self subclassResponsibility
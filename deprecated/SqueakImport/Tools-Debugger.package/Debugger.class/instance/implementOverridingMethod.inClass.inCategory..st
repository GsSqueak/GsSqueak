context stack menu
implementOverridingMethod: aMessage inClass: aClass inCategory: aSymbol
	"Create a stub implementation of the overriding message and sew it onto the top of the stack, ensuring the context's arguments are set correctly. Debug the new context."
	self pushStubMethodOnStack: aMessage inClass: aClass inCategory: aSymbol.

	"Cut out the sender context. This is the context that signalled the SubclassResponsibility."
	self selectedContext privSender: self selectedContext sender sender.
	self resetContext: self selectedContext.
	self debug.
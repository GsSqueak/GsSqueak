context stack menu
implementMissingMethod: aMessage inClass: aClass inCategory: aSymbol
	"Create a stub implementation of the missing message and sew it onto the top of the stack, ensuring the context's arguments are set correctly. Debug the new context."
	self pushStubMethodOnStack: aMessage inClass: aClass inCategory: aSymbol.

	"Cut out the sender context. This is the context that signalled the MessageNotUnderstood."
	self selectedContext privSender: self selectedContext sender.
	self resetContext: self selectedContext.
	self debug.
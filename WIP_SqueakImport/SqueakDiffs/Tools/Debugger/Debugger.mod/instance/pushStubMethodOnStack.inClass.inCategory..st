private
pushStubMethodOnStack: aMessage inClass: aClass inCategory: aSymbol
	"Create a stub implementation of the message and sew it onto the top of the stack, ensuring the context's arguments are set correctly."
	aClass
		compile: aMessage createStubMethod
		classified: aSymbol.
	self setContentsToForceRefetch.
	self selectedContext privRefreshWith: (aClass lookupSelector: aMessage selector).
	aMessage numArgs > 0 ifTrue:
		[aMessage arguments withIndexDo:
			[:arg :index|
			self selectedContext tempAt: index put: arg]].
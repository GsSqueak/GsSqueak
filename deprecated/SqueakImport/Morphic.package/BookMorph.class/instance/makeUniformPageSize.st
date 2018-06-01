menu
makeUniformPageSize
	"Make all pages be of the same size as the current page."
	currentPage ifNil: [^ Beeper beep].
	self resizePagesTo: currentPage extent.
	newPagePrototype ifNotNil:
		[newPagePrototype extent: currentPage extent]
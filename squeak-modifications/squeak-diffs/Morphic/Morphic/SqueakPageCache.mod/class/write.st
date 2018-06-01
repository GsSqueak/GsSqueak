cache access
write
	"Write out all dirty pages"
	GlobalPolicy == #neverWrite ifTrue: [^ self].
	self doPagesInMemory: [:aPage | aPage write].
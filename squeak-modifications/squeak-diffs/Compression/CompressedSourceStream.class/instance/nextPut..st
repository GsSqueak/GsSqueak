access
nextPut: char
	"Slow, but we don't often write, and then not a lot"
	self nextPutAll: char asString.
	^ char
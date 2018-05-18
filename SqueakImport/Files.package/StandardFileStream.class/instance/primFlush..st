primitives
primFlush: id
	"Flush pending changes to the disk"
	| p |
	self halt.
	"In some OS's seeking to 0 and back will do a flush"
	p := self position.
	self position: 0; position: p
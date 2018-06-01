primitives
primSync: id
	"Call fsync to really, really, flush pending changes to the disk"
	| p |
	self halt.
	"In some OS's seeking to 0 and back will do a flush. Maybe that will help if we dont have the primitives"
	p := self position.
	self position: 0; position: p
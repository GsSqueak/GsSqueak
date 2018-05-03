garbage collection
noteAsRoot: oop headerLoc: headerLoc 
	"Record that the given oop in the old object area points to an 
	object in the young area. 
	HeaderLoc is usually = oop, but may be an addr in a 
	forwarding block."
	self subclassResponsibility
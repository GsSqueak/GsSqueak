scripts-vector
multBy: aNumber 
	"Treating Players like vectors, scale myself by aNumber"
	self setX: self getX * aNumber asPoint x.
	self setY: self getY * aNumber asPoint y
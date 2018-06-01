scripts-vector
incr: aPlayer 
	"Treating Players like vectors, add aPlayer to me"
	self setX: self getX + aPlayer asPoint x.
	self setY: self getY + aPlayer asPoint y
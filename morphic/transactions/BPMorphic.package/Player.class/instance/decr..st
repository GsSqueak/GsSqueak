scripts-vector
decr: aPlayer 
	"Treating Players like vectors, subtract aPlayer from me"
	self setX: self getX - aPlayer asPoint x.
	self setY: self getY - aPlayer asPoint y
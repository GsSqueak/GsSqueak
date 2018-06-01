scripts-vector
dividedBy: aNumber 
	"Treating Players like vectors, divide myself by aNumber"
	self setX: self getX / aNumber asPoint x.
	self setY: self getY / aNumber asPoint y
operations
go: distance 
	"Move the pen in its current direction a number of bits equal to the 
	argument, distance. If the pen is down, a line will be drawn using the 
	receiver's form source as the shape of the drawing brush."

	self goto: (direction degreeCos @ direction degreeSin) * distance + location
private
transparentRectangle
	"This could be a class var, provided either bounds of grips does not
	change, or one ensures a new one is installed when such an event
	occurs "
	^ Form extent: self bounds extent depth: 32
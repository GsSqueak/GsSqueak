private
paint:color operation:operation
	self setColor:color.
	currentColor isTransparent ifFalse:[target perform:operation] ifTrue:[target newpath].

              
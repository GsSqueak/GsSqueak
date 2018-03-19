-Etoys-geometry
heading: newHeading 
	"Set the receiver's heading (in eToy terms)"
	self isFlexed
		ifFalse: [self addFlexShell].
	owner rotationDegrees: newHeading - self forwardDirection
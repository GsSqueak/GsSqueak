accessing
beginPoint: aPoint 
	"Set the first end point of the receiver to be the argument, aPoint. 
	Answer aPoint."

	self at: 1 put: aPoint.
	^aPoint
accessing
secondPoint: aPoint 
	"Replace the second element of the receiver with the new value aPoint. 
	Answer the argument aPoint."

	collectionOfPoints at: 2 put: aPoint.
	^aPoint
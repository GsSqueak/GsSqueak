accessing
firstPoint: aPoint 
	"Replace the first element of the receiver with the new value aPoint. 
	Answer the argument aPoint."

	collectionOfPoints at: 1 put: aPoint.
	^aPoint
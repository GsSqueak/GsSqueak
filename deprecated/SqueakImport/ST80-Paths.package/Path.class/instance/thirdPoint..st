accessing
thirdPoint: aPoint 
	"Replace the third element of the receiver with the new value aPoint. 
	Answer the argument aPoint."

	collectionOfPoints at: 3 put: aPoint.
	^aPoint
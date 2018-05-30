displaying
displayOnPort: aPort at: aPoint 
	aPort sourceForm: self form; combinationRule: Form under; fillColor: nil.
	aPort drawFrom: collectionOfPoints first + aPoint
		to: collectionOfPoints last + aPoint
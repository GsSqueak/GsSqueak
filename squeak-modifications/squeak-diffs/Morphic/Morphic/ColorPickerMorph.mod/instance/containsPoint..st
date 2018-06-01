geometry testing
containsPoint: aPoint 
	^ (super containsPoint: aPoint)
		or: [RevertBox containsPoint: aPoint - self topLeft]
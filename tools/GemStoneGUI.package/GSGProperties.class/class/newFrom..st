instance creation
newFrom: anObject

	^ self new
		initializeFrom: anObject;
		yourself
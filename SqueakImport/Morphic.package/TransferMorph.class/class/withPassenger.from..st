instance creation
withPassenger: anObject from: source 
	
	^ self new
		passenger: anObject;
		source: source;
		yourself
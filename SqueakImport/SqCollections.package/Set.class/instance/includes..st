testing
includes: anObject 
	
	(array at: (self scanFor: anObject)) ifNil: [ ^false ] ifNotNil: [ ^true ]
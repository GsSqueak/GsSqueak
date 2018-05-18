testing
includes: anObject 
	
	(array at: (self scanFor: (keyBlock value: anObject))) ifNil: [ ^false ] ifNotNil: [ ^true ]
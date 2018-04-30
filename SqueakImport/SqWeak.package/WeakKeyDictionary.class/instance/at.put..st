accessing
at: key put: anObject 
	"Set the value at key to be anObject.  If key is not found, create a new
	entry for key and set is value to anObject. Answer anObject."
	
	key ifNil: [ ^anObject ].
	^super at: key put: anObject
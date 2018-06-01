debug support
addressCouldBeClassObj: maybeClassObj 
	"Answer if maybeClassObj looks like a class object"
	^ (objectMemory addressCouldBeObj: maybeClassObj)
		and: [self objCouldBeClassObj: maybeClassObj]
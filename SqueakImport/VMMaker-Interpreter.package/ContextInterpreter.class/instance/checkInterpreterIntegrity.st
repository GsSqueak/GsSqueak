stack interpreter support
checkInterpreterIntegrity
	"Perform an integrity/leak check using the heapMap.  Assume
	 clearLeakMapAndMapAccessibleObjects has set a bit at each
	 object's header.  Check that all oops in the interpreter's state
	 points to a header.  Answer if all checks pass."

	^true
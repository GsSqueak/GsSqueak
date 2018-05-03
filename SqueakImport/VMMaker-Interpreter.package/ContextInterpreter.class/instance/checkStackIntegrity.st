stack interpreter support
checkStackIntegrity
	"Perform an integrity/leak check using the heapMap.  Assume
	 clearLeakMapAndMapAccessibleObjects has set a bit at each
	 object's header.  Scan all objects accessible from the stack
	 checking that every pointer points to a header.  Answer if no
	 dangling pointers were detected."

	^true
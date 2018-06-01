utilities
pointersTo: anObject except: objectsToExclude
	"Find all occurrences in the system of pointers to the argument anObject. 
	Remove objects in the exclusion list from the results."
	
	^ anObject inboundPointersExcluding: objectsToExclude
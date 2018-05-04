initialization
initialize
	<doNotGenerate>
	"Initialize NewObjectMemory when simulating the VM inside Smalltalk."
	super initialize.
	checkForLeaks := fullGCLock := 0
initialize-release
initialize
	"Fix for inconsistent image state in which ObjectTracer improperly appears as a subclass
	of Class. This initialization should appear in the Squeak update stream in order to repair
	existing images, and may be removed in a future update."

	Class removeSubclass: ObjectTracer class
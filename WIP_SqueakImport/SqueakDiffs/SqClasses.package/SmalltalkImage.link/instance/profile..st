vm profiling
profile: aBlock
	"Make a virtual machine profile of the given block."
	"Note: Profiling support is provided so that VM implementors
	 can better understand and improve the efficiency of the virtual
	 machine. To use it, you must be running a version of the
	 virtual machine compiled with profiling enabled (which
	 makes it much slower than normal even when not profiling).
	 You will also need the CodeWarrior profile reader application."

	self stopProfiling.
	self clearProfile.
	self startProfiling.
	aBlock value.
	self stopProfiling.
	self dumpProfile.

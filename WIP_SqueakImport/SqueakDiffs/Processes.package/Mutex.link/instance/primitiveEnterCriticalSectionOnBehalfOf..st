system simulation
primitiveEnterCriticalSectionOnBehalfOf: effectiveProcess
	"Primitive. Simulate primitiveEnterCriticalSection.  The receiver
	 must be unowned or owned by the effectiveProcess to proceed.
	 Answer if the process is already owned by the current process."
	self shouldNotImplement

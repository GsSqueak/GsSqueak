control primitives
primitiveClosureValueNoContextSwitch
	"An exact clone of primitiveClosureValue except that this version will not
	 check for interrupts on stack overflow.  It may invoke the garbage collector
	 but will not switch processes.  See checkForInterruptsMayContextSwitch:"
	self subclassResponsibility
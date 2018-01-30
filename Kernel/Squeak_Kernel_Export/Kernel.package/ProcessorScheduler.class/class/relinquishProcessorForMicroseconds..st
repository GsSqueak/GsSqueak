background process
relinquishProcessorForMicroseconds: anInteger
	"Platform specific. This primitive is used to return processor cycles to the host operating system when Squeak's idle process is running (i.e., when no other Squeak process is runnable). On some platforms, this primitive causes the entire Squeak application to sleep for approximately the given number of microseconds. No Squeak process can run while the Squeak application is sleeping, even if some external event makes it runnable. On the Macintosh, this primitive simply calls GetNextEvent() to give other applications a chance to run. On platforms without a host operating system, it does nothing. This primitive should not be used to add pauses to a Squeak process; use a Delay instead."

	<primitive: 230>
	"don't fail if primitive is not implemented, just do nothing"

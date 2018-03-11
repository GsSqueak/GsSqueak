termination
terminate

	OSProcess thisOSProcess sigterm: self process.
	self inPipe close.
	self outPipe close.
	self errPipe close
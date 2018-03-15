termination
terminate

	OSProcess thisOSProcess sigterm: self process.
	self closePipes
printing
printOn: stream

	super printOn: stream.
"
	stream space.
	self contents printOn: stream.
	
	NOTE: some subclasses actually read from the stream to return its contents.
	To not modify the state we must *not* send contents here. 
"
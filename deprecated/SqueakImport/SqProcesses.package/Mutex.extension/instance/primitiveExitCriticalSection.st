*SqProcesses-private-primitives
primitiveExitCriticalSection
	"Primitive. Set the receiver to unowned and if any processes are waiting on
	 the receiver then proceed the first one, indicating that the receiver is unowned.

	 Copyright (c) 2016 - 3D Immersive Collaboration Consulting, LLC."
	<primitive: 185>
	self primitiveFailed
	"In the spirit of the following"
	"[owner := nil.
	  self isEmpty ifFalse:
		[process := self removeFirst.
		 process resume]] valueUnpreemptively"

*SqProcesses-private-primitives
primitiveTestAndSetOwnershipOfCriticalSection
	"Primitive. Attempt to set the ownership of the receiver.
	 If the receiver is unowned set its owningProcess to the
	 activeProcess and answer false.  If the receiver is owned
	 by the activeProcess answer true.  If the receiver is owned
	 by some other process answer nil.

	 Copyright (c) 2016 - 3D Immersive Collaboration Consulting, LLC."
	<primitive: 187>
	self primitiveFailed
	"In the spirit of the following"
	"[owner ifNil:
		[owningProcess := Processor activeProcess.
		 ^false].
	  owner = Processor activeProcess ifTrue: [^true].
	  ^nil] valueUnpreemptively"

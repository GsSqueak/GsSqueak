*SqProcesses-private-primitives
primitiveEnterCriticalSection
	"Primitive. The receiver must be unowned or owned by the current process to proceed.
	 Answer if the process is owned by the current process.

	 Copyright (c) 2016 - 3D Immersive Collaboration Consulting, LLC."
	<primitive: 186>
	self primitiveFailed
	"In the spirit of the following"
	"[owner ifNil:
		[owner := Processor activeProcess.
		 ^false].
	  owner = Processor activeProcess ifTrue:
		[^true].
	  self addLast: Processor activeProcess.
	  Processor activeProcess suspend] valueUnpreemptively"

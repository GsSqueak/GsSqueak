process primitives
primitiveResume
	"Put this process on the scheduler's lists thus allowing it to proceed next
	time there is a chance for processes of its priority level"

	| proc |
	proc := self stackTop.  "rcvr"
	"self success: ((self fetchClassOf: proc) = (self splObj: ClassProcess))."
	(self isContext: (objectMemory fetchPointer: SuspendedContextIndex ofObject: proc)) ifFalse:
		[^self primitiveFail].
	self successful ifTrue: [ self resume: proc ].
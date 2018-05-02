*SqProcesses-system simulation
primitiveTestAndSetOwnershipOfCriticalSectionOnBehalfOf: effectiveProcess
	"Primitive. Simulate primitiveEnterCriticalSection.  Attempt to set the ownership
	 of the receiver.  If the receiver is unowned set its owningProcess to the
	 effectiveProcess and answer false.  If the receiver is owned by the effectiveProcess
	 answer true.  If the receiver is owned by some other process answer nil."
	<primitive: 187>
	^Context primitiveFailTokenFor: nil

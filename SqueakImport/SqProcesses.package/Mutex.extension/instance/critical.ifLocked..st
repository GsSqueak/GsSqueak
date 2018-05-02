*SqProcesses-mutual exclusion
critical: aBlock ifLocked: lockedBlock
	"Answer the evaluation of aBlock protected by the receiver.  If it is already in a critical
	 section on behalf of some other process answer the evaluation of lockedBlock."
	<criticalSection>
	^self primitiveTestAndSetOwnershipOfCriticalSection
		ifNil: [lockedBlock value]
		ifNotNil:
			[:alreadyOwner|
			 alreadyOwner
				ifTrue: [aBlock value]
				ifFalse: [aBlock ensure: [self primitiveExitCriticalSection]]]

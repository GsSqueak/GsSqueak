mutual exclusion
critical: aBlock
	"Evaluate aBlock protected by the receiver."
	<criticalSection>
	^self primitiveEnterCriticalSection
		ifTrue: [aBlock value]
		ifFalse: [aBlock ensure: [self primitiveExitCriticalSection]]
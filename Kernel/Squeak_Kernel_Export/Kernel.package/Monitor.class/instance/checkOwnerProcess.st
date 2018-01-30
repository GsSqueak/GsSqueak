private
checkOwnerProcess
	"If the receiver is not already the owner of the section raise an error."
	(self primitiveTestAndSetOwnershipOfCriticalSection
		ifNil: [false]
		ifNotNil:
			[:alreadyOwner|
			alreadyOwner
			or: [self primitiveExitCriticalSection.
				false]]) ifFalse:
		[self error: 'Monitor access violation']
private
checkOwnerProcess
	"If the receiver is not already the owner of the section raise an error."
	
	self primitiveTestAndSetOwnershipOfCriticalSection ifNotNil: [ :alreadyOwner |
		alreadyOwner ifTrue: [ ^self ].
		self primitiveExitCriticalSection ].
	self error: 'Monitor access violation'
menu commands
enableDisableGlobalFlapWithID: aFlapID
	"Toggle the enable/disable status of the given global flap"

	| disabledFlapIDs  aFlapTab currentProject |
	(currentProject := Project current) assureFlapIntegrity.
	Smalltalk isMorphic ifFalse: [^ self].
	disabledFlapIDs := currentProject parameterAt: #disabledGlobalFlapIDs.
	(aFlapTab := self globalFlapTabWithID: aFlapID) ifNotNil:
		[aFlapTab hideFlap].
	(disabledFlapIDs includes: aFlapID)
		ifTrue:
			[disabledFlapIDs remove: aFlapID.
			self currentWorld addGlobalFlaps]
		ifFalse:
			[disabledFlapIDs add: aFlapID.
			aFlapTab ifNotNil: [aFlapTab delete]].
	self doAutomaticLayoutOfFlapsIfAppropriate
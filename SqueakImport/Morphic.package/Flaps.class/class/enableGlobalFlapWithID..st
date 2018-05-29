menu commands
enableGlobalFlapWithID: aFlapID
	"Remove any memory of this flap being disabled in this project"

	| disabledFlapIDs  currentProject |
	(currentProject := Project current) assureFlapIntegrity.
	Smalltalk isMorphic ifFalse: [^ self].
	disabledFlapIDs := currentProject parameterAt: #disabledGlobalFlapIDs ifAbsent: [^ self].
	disabledFlapIDs remove: aFlapID ifAbsent: []
	
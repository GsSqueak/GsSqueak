menu commands
enableGlobalFlapWithID: aFlapID 
	"Remove any memory of this flap being disabled in this project"
	| _gsSqueakTemp_disabledFlapIDs _gsSqueakTemp_currentProject |
	(_gsSqueakTemp_currentProject := Project current) assureFlapIntegrity.
	Smalltalk isMorphic
		ifFalse: [^ self].
	_gsSqueakTemp_disabledFlapIDs := _gsSqueakTemp_currentProject
				parameterAt: #disabledGlobalFlapIDs
				ifAbsent: [^ self].
	_gsSqueakTemp_disabledFlapIDs
		remove: aFlapID
		ifAbsent: []
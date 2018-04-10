menu commands
enableDisableGlobalFlapWithID: aFlapID 
	"Toggle the enable/disable status of the given global flap"
	| _gsSqueakTemp_disabledFlapIDs _gsSqueakTemp_aFlapTab _gsSqueakTemp_currentProject |
	(_gsSqueakTemp_currentProject := Project current) assureFlapIntegrity.
	Smalltalk isMorphic
		ifFalse: [^ self].
	_gsSqueakTemp_disabledFlapIDs := _gsSqueakTemp_currentProject parameterAt: #disabledGlobalFlapIDs.
	(_gsSqueakTemp_aFlapTab := self globalFlapTabWithID: aFlapID)
		ifNotNil: [_gsSqueakTemp_aFlapTab hideFlap].
	(_gsSqueakTemp_disabledFlapIDs includes: aFlapID)
		ifTrue: [_gsSqueakTemp_disabledFlapIDs remove: aFlapID.
			self currentWorld addGlobalFlaps]
		ifFalse: [_gsSqueakTemp_disabledFlapIDs add: aFlapID.
			_gsSqueakTemp_aFlapTab
				ifNotNil: [_gsSqueakTemp_aFlapTab delete]].
	self doAutomaticLayoutOfFlapsIfAppropriate
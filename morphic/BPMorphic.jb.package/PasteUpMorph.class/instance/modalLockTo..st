polymorph
modalLockTo: aSystemWindow 
	"Don't lock the world! Lock the submorphs.
	The modal window gets opened afterwards so is OK."
	| lockStates |
	lockStates := IdentityDictionary new.
	self
		submorphsDo: [:m | 
			lockStates at: m put: m isLocked.
			m lock].
	self setProperty: #submorphLockStates toValue: lockStates
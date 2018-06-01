eToy login
proceedWithLogin
	eToyAuthentificationServer := nil.
	Project current world submorphsDo:[:m| m show].
	WorldState addDeferredUIMessage: [self startUpAfterLogin].
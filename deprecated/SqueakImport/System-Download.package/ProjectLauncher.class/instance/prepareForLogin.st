eToy login
prepareForLogin
	"Prepare for login - e.g., hide everything so only the login morph is visible."
	| world |
	world := Project current world.
	world submorphsDo:[:m| 
		m isLocked ifFalse:[m hide]]. "hide all those guys"
	world displayWorldSafely.

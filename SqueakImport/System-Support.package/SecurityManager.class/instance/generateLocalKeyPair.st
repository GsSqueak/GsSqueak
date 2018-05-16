private
generateLocalKeyPair
	"SecurityManager default generateLocalKeyPair"
	"Generate a key set on the local machine."
	| dsa |
	dsa := DigitalSignatureAlgorithm new.
	dsa initRandomFromString: 
		Time millisecondClockValue printString, 
		Date today printString, 
		Smalltalk platformName printString.
	privateKeyPair := dsa generateKeySet.
	self storeSecurityKeys.
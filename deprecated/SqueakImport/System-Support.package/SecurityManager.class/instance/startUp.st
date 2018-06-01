initialize-release
startUp
	"Attempt to load existing keys"
	self loadSecurityKeys.
	(privateKeyPair == nil 
		and:[self isInRestrictedMode not
		and:[Preferences automaticKeyGeneration]]) ifTrue:[
			self generateKeyPairInBackground.
	].
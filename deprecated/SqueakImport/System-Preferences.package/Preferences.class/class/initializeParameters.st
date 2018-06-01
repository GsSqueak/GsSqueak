parameters
initializeParameters
	"Preferences initializeParameters"
	Parameters := IdentityDictionary new.
	Parameters at: #maxBalloonHelpLineLength put: 28.
	self initializeTextHighlightingParameters
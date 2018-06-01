fileIn/Out
releaseCachedState
	"release all non-showing scriptors"
	self class
		userScriptsDo: [:userScript | userScript releaseCachedState]
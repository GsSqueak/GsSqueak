caching
fullLoadCachedState
	"Load the cached state of the receiver and its full submorph tree."

	self allMorphsDo: [:m | m loadCachedState].

caching
loadCachedState
	"Load the cached state of this morph. This method may be called to
	pre-load the cached state of a morph to avoid delays when it is first
	used. (Cached state can always be recompued on demand, so a
	morph should not rely on this method being called.) Implementations
	of this method should do 'super loadCachedState'. This default
	implementation does nothing."
	^ self
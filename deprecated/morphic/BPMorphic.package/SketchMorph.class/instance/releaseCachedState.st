caching
releaseCachedState
	"Clear cache of rotated, scaled Form."
	super releaseCachedState.
	rotatedForm := nil.
	originalForm hibernate
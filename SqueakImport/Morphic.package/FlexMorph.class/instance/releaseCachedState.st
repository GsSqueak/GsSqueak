caching
releaseCachedState
	"Clear cache of rotated, scaled Form."

	originalForm := Form extent: 10@10.  "So super hibernate won't have to work hard
												but won't crash either."
	super releaseCachedState.
	rotatedForm := nil.
	originalForm := nil.
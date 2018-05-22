caching
releaseCachedState

	"see if we can reduce size of published file, but there may be problems"
	super releaseCachedState.
	lastProjectThumbnail := image.

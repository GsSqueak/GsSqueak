cache access
removeURL: aURLString
	"Remove the cache entry for the given URL. Do nothing if it has no cache entry."

	PageCache removeKey: aURLString ifAbsent: [].

caching
releaseCachedState
	"Release the cached state of all my pages."

	super releaseCachedState.
	self removeProperty: #allText.	"the cache for text search"
	pages do: [:page | 
		page == currentPage ifFalse: [page fullReleaseCachedState].
		page removeProperty: #cachedThumbnail].
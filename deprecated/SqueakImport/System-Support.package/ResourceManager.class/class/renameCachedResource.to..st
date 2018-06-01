resource caching
renameCachedResource: urlString to: newUrlString
	"A project was renamed. Reflect this change by duplicating the cache entry to the new url."
	self renameCachedResource: urlString to: newUrlString external: true
initialization
initializeCaches

	MethodCacheEntries := 512. 
	MethodCacheSelector := 1.
	MethodCacheClass := 2.
	MethodCacheMethod := 3.
	MethodCachePrim := 4.
	MethodCacheNative := 5.
	MethodCachePrimFunction := 6.
	MethodCacheEntrySize := 8.  "Must be power of two for masking scheme."
	MethodCacheMask := (MethodCacheEntries - 1) * MethodCacheEntrySize.
	MethodCacheSize := MethodCacheEntries * MethodCacheEntrySize.
	CacheProbeMax := 3.

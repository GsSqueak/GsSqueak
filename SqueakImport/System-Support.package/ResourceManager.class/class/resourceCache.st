resource caching
resourceCache
	^CachedResources ifNil:[
		CachedResources := Dictionary new.
		self reloadCachedResources.
		CachedResources].
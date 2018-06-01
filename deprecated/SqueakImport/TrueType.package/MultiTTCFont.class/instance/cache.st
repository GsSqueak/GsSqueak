all
cache
	(cache isNil or: [cache size ~= 512]) ifTrue: [self recreateCache]. "old weak-array caching"
	^cache
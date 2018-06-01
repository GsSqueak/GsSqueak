resource caching
renameCachedResource: urlString to: newUrlString external: isExternal
	"A project was renamed. Reflect this change by duplicating the cache entry to the new url."
	| candidates |
	CachedResources
		ifNil:[
			isExternal
				ifTrue: [self resourceCache "force init" ]
				ifFalse: [^self]].
	candidates := CachedResources at: urlString ifAbsent:[nil].
	(candidates isNil or:[candidates size = 0])
		ifFalse: [
		candidates do: [:candidate |
			self addCacheLocation: candidate for: newUrlString]].
	isExternal
		ifTrue: [self relocatedExternalResource: urlString to: newUrlString]
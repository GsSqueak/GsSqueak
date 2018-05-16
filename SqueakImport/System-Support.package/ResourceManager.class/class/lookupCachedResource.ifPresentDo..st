resource caching
lookupCachedResource: cachedUrlString ifPresentDo: streamBlock
	"See if we have cached the resource described by the given url and if so, evaluate streamBlock with the cached resource."
	|  urlString candidates url stream |
	CachedResources ifNil:[^self].

	candidates := CachedResources at: cachedUrlString ifAbsent:[nil].
	(self lookupCachedResource: cachedUrlString in: candidates ifPresentDo: streamBlock)
		ifTrue: [^self].

	urlString := self relocatedExternalResource: cachedUrlString.
	urlString ifNil: [^self].
	candidates := CachedResources at: urlString ifAbsent:[nil].
	candidates
		ifNil: [
			(url := urlString asUrl) schemeName = 'file'
				ifTrue: [
					stream := [FileStream readOnlyFileNamed: url pathForFile] 
							on: FileDoesNotExistException do:[:ex| ex return: nil].
					stream
						ifNotNil: [[streamBlock value: stream] ensure: [stream close]]]]
		ifNotNil: [self lookupCachedResource: urlString in: candidates ifPresentDo: streamBlock]
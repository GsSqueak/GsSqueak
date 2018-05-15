resource caching
lookupCachedResource: urlString in: candidates ifPresentDo: streamBlock
	"See if we have cached the resource described by the given url and if so, evaluate streamBlock with the cached resource."
	| sortedCandidates dir |
	(candidates isNil or:[candidates size = 0])
		ifTrue:[^false].
	"First, try non-zip members (faster since no decompression is involved)"
	sortedCandidates := (candidates reject:[:each| each beginsWith: 'zip://']),
					(candidates select:[:each| each beginsWith: 'zip://']).
	dir := Project squeakletDirectory.
	sortedCandidates do:[:fileName|
		| file |
		file := self loadResource: urlString fromCacheFileNamed: fileName in: dir.
		file ifNotNil:[
			[streamBlock value: file] ensure:[file close].
			^true]].
	^false
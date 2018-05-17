resource caching
reloadCachedResources	"ResourceManager reloadCachedResources"
	"Reload cached resources from the disk"
	| fd files stream url localName storeBack archiveName |
	CachedResources := Dictionary new.
	LocalizedExternalResources := nil.
	fd := Project squeakletDirectory.
	files := fd fileNames asSet.
	stream := [fd readOnlyFileNamed: self resourceCacheName]
				on: FileDoesNotExistException 
				do:[:ex| fd forceNewFileNamed: self resourceCacheName].
	stream size < 50000 ifTrue:[stream := ReadStream on: stream contentsOfEntireFile].
	storeBack := false.
	[stream atEnd] whileFalse:[
		url := stream nextLine.	
		localName := stream nextLine.
		(localName beginsWith: 'zip://') ifTrue:[
			archiveName := localName copyFrom: 7 to: localName size.
			(files includes: archiveName) 
				ifTrue:[self addCacheLocation: localName for: url]
				ifFalse:[storeBack := true].
		] ifFalse:[
			(files includes: localName) 
				ifTrue:[self addCacheLocation: localName for: url]
				ifFalse:[storeBack := true]
		].
	].
	stream close.
	storeBack ifTrue:[
		stream := fd forceNewFileNamed: self resourceCacheName.
		CachedResources keysAndValuesDo:[:urlString :cacheLocs|
			cacheLocs do:[:cacheLoc|
				stream nextPutAll: urlString; cr.
				stream nextPutAll: cacheLoc; cr].
		].
		stream close.
	].
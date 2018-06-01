resource caching
cacheResource: urlString stream: aStream
	| fd localName file buf |
	HTTPClient shouldUsePluginAPI ifTrue:[^self]. "use browser cache"
	(self resourceCache at: urlString ifAbsent:[#()]) size > 0 
		ifTrue:[^self]. "don't waste space"
	fd := Project squeakletDirectory.
	localName := fd nextNameFor: 'resource' extension:'cache'.
	file := fd forceNewFileNamed: localName.
	buf := ByteArray new: 10000.
	aStream binary.
	file binary.
	[aStream atEnd] whileFalse:[
		buf := aStream next: buf size into: buf.
		file nextPutAll: buf.
	].
	file close.
	"update cache"
	file := [fd oldFileNamed: self resourceCacheName] 
			on: FileDoesNotExistException
			do:[:ex| fd forceNewFileNamed: self resourceCacheName].
	file setToEnd.
	file nextPutAll: urlString; cr.
	file nextPutAll: localName; cr.
	file close.
	self addCacheLocation: localName for: urlString.
	aStream position: 0.

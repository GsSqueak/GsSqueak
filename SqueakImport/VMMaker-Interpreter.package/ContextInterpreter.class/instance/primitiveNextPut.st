deprecated - array and stream primitives
primitiveNextPut
	"PrimitiveNextPut will succeed only if the stream's array is in the atPutCache.
	Otherwise failure will lead to proper message lookup of at:put: and
	subsequent installation in the cache if appropriate.
	nb: This primitive was previously installed as primitive 66, but is no
	longer in use."
	| value stream index limit array atIx |
	value := self stackTop.
	stream := self stackValue: 1.
	((objectMemory isPointers: stream)
		and: [(objectMemory lengthOf: stream) >= (StreamReadLimitIndex + 1)])
		ifFalse: [^ self primitiveFail].

	array := objectMemory fetchPointer: StreamArrayIndex ofObject: stream.
	index := self fetchInteger: StreamIndexIndex ofObject: stream.
	limit := self fetchInteger: StreamWriteLimitIndex ofObject: stream.
	atIx := (array bitAnd: AtCacheMask) + AtPutBase.
	(index < limit and: [(atCache at: atIx+AtCacheOop) = array])
		ifFalse: [^ self primitiveFail].

	"OK -- its not at end, and the array is in the cache"
	index := index + 1.
	self commonVariable: array at: index put: value cacheIndex: atIx.
	self successful ifTrue:
		[self storeInteger: StreamIndexIndex ofObject: stream withValue: index.
		^ self pop: 2 thenPush: value].

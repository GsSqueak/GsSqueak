deprecated - array and stream primitives
primitiveNext
	"PrimitiveNext will succeed only if the stream's array is in the atCache.
	Otherwise failure will lead to proper message lookup of at: and
	subsequent installation in the cache if appropriate.
	nb: This primitive was previously installed as primitive 65, but is no
	longer in use."
	| stream array index limit result atIx |
	stream := self stackTop.
	((objectMemory isPointers: stream)
		and: [(objectMemory lengthOf: stream) >= (StreamReadLimitIndex + 1)])
		ifFalse: [^ self primitiveFail].

	array := objectMemory fetchPointer: StreamArrayIndex ofObject: stream.
	index := self fetchInteger: StreamIndexIndex ofObject: stream.
	limit := self fetchInteger: StreamReadLimitIndex ofObject: stream.
	atIx := array bitAnd: AtCacheMask.
	(index < limit and: [(atCache at: atIx+AtCacheOop) = array])
		ifFalse: [^ self primitiveFail].

	"OK -- its not at end, and the array is in the cache"
	index := index + 1.
	result := self commonVariable: array at: index cacheIndex: atIx.
	"Above may cause GC, so can't use stream, array etc. below it"
	self successful ifTrue:
		[stream := self stackTop.
		self storeInteger: StreamIndexIndex ofObject: stream withValue: index.
		^ self pop: 1 thenPush: result].

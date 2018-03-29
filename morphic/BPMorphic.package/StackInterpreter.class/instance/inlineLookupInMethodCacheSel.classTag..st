method lookup cache
inlineLookupInMethodCacheSel: selector classTag: classTag 
	"This method implements a simple method lookup cache. If an entry
	for the given selector and classTag is
	found in the cache, set the values of 'newMethod' and
	'primitiveFunctionPointer' and answer true. Otherwise,
	answer false."
	"About the re-probe scheme: The hash is the low bits of the XOR of two
	large addresses, minus their useless
	lowest two bits. If a probe doesn't get a hit, the hash is shifted right
	one bit to compute the next probe,
	introducing a new randomish bit. The cache is probed
	CacheProbeMax times before giving up."
	"WARNING: Since the hash computation is based on the object
	addresses of the class and selector, we must
	rehash or flush when compacting storage. We've chosen to flush,
	since that also saves the trouble of updating
	the addresses of the objects in the cache."
	"classTag is either a class object, if using NewObjectMemory, or a
	classIndex, if using SpurMemoryManager."
	| _gsSqueakTemp_hash _gsSqueakTemp_probe |
	_gsSqueakTemp_hash := objectMemory methodCacheHashOf: selector with: classTag.
	"shift drops two low-order zeros from addresses"
	_gsSqueakTemp_probe := _gsSqueakTemp_hash bitAnd: MethodCacheMask.
	"first probe"
	((methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
				= selector
			and: [(methodCache at: _gsSqueakTemp_probe + MethodCacheClass)
					= classTag])
		ifTrue: [newMethod := methodCache at: _gsSqueakTemp_probe + MethodCacheMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (methodCache at: _gsSqueakTemp_probe + MethodCachePrimFunction)
						to: #'void (*)()'.
			^ true"found entry in cache; done"].
	_gsSqueakTemp_probe := _gsSqueakTemp_hash >> 1 bitAnd: MethodCacheMask.
	"second probe"
	((methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
				= selector
			and: [(methodCache at: _gsSqueakTemp_probe + MethodCacheClass)
					= classTag])
		ifTrue: [newMethod := methodCache at: _gsSqueakTemp_probe + MethodCacheMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (methodCache at: _gsSqueakTemp_probe + MethodCachePrimFunction)
						to: #'void (*)()'.
			^ true"found entry in cache; done"].
	_gsSqueakTemp_probe := _gsSqueakTemp_hash >> 2 bitAnd: MethodCacheMask.
	((methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
				= selector
			and: [(methodCache at: _gsSqueakTemp_probe + MethodCacheClass)
					= classTag])
		ifTrue: [newMethod := methodCache at: _gsSqueakTemp_probe + MethodCacheMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (methodCache at: _gsSqueakTemp_probe + MethodCachePrimFunction)
						to: #'void (*)()'.
			^ true"found entry in cache; done"].
	^ false
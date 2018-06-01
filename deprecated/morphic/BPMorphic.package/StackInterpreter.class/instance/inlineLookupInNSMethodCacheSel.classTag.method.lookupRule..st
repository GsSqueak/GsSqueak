method lookup cache
inlineLookupInNSMethodCacheSel: selector classTag: classTag method: callingMethod lookupRule: lookupRule 
	"Like inlineLookupInMethodCacheSel:classTag:, but the cache is
	additionally key'd by the calling method and lookupRule/depth and
	additionally answers localAbsentReceiverOrZero."
	| _gsSqueakTemp_hash _gsSqueakTemp_probe |
	_gsSqueakTemp_hash := (objectMemory methodCacheHashOf: selector with: classTag)
				bitXor: (callingMethod bitXor: lookupRule).
	_gsSqueakTemp_probe := _gsSqueakTemp_hash bitAnd: NSMethodCacheMask.
	"first probe"
	((((nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector)
						= selector
					and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheClassTag)
							= classTag])
				and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheCallingMethod)
						= callingMethod])
			and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheDepthOrLookupRule)
					= lookupRule])
		ifTrue: [newMethod := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheTargetMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (nsMethodCache at: _gsSqueakTemp_probe + NSMethodCachePrimFunction)
						to: #'void (*)()'.
			localAbsentReceiverOrZero := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheActualReceiver.
			^ true"found entry in cache; done"].
	_gsSqueakTemp_probe := _gsSqueakTemp_hash >> 1 bitAnd: NSMethodCacheMask.
	"second probe"
	((((nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector)
						= selector
					and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheClassTag)
							= classTag])
				and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheCallingMethod)
						= callingMethod])
			and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheDepthOrLookupRule)
					= lookupRule])
		ifTrue: [newMethod := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheTargetMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (nsMethodCache at: _gsSqueakTemp_probe + NSMethodCachePrimFunction)
						to: #'void (*)()'.
			localAbsentReceiverOrZero := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheActualReceiver.
			^ true"found entry in cache; done"].
	_gsSqueakTemp_probe := _gsSqueakTemp_hash >> 2 bitAnd: NSMethodCacheMask.
	((((nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector)
						= selector
					and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheClassTag)
							= classTag])
				and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheCallingMethod)
						= callingMethod])
			and: [(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheDepthOrLookupRule)
					= lookupRule])
		ifTrue: [newMethod := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheTargetMethod.
			primitiveFunctionPointer := self
						cCoerceSimple: (nsMethodCache at: _gsSqueakTemp_probe + NSMethodCachePrimFunction)
						to: #'void (*)()'.
			localAbsentReceiverOrZero := nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheActualReceiver.
			^ true"found entry in cache; done"].
	^ false
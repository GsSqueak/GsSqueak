method lookup cache
addNewMethodToCache: classObj 
	"Add the given entry to the method cache.
	The policy is as follows:
	Look for an empty entry anywhere in the reprobe chain.
	If found, install the new entry there.
	If not found, then install the new entry at the first probe position
	and delete the entries in the rest of the reprobe chain.
	This has two useful purposes:
	If there is active contention over the first slot, the second
	or third will likely be free for reentry after ejection.
	Also, flushing is good when reprobe chains are getting full."
	| _gsSqueakTemp_probe _gsSqueakTemp_hash _gsSqueakTemp_primitiveIndex |
	_gsSqueakTemp_hash := objectMemory
				methodCacheHashOf: messageSelector
				with: (objectMemory classTagForClass: classObj).
	"shift drops low-order zeros from addresses"
	(objectMemory isOopCompiledMethod: newMethod)
		ifTrue: [_gsSqueakTemp_primitiveIndex := self primitiveIndexOf: newMethod.
			primitiveFunctionPointer := self functionPointerFor: _gsSqueakTemp_primitiveIndex inClass: classObj]
		ifFalse: [self assert: ((objectMemory isNonImmediate: newMethod)
					and: [objectMemory isForwarded: newMethod]) not.
			primitiveFunctionPointer := #primitiveInvokeObjectAsMethod].
	0
		to: CacheProbeMax - 1
		do: [:p | 
			_gsSqueakTemp_probe := _gsSqueakTemp_hash >> p bitAnd: MethodCacheMask.
			(methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
					= 0
				ifTrue: ["Found an empty entry -- use it"
					methodCache at: _gsSqueakTemp_probe + MethodCacheSelector put: messageSelector.
					methodCache
						at: _gsSqueakTemp_probe + MethodCacheClass
						put: (objectMemory classTagForClass: classObj).
					methodCache at: _gsSqueakTemp_probe + MethodCacheMethod put: newMethod.
					methodCache
						at: _gsSqueakTemp_probe + MethodCachePrimFunction
						put: (self cCoerce: primitiveFunctionPointer to: #'sqIntptr_t').
					lastMethodCacheProbeWrite := _gsSqueakTemp_probe.
					"this for primitiveExternalMethod"
					^ self]].
	"OK, we failed to find an entry -- install at the first slot..."
	_gsSqueakTemp_probe := _gsSqueakTemp_hash bitAnd: MethodCacheMask.
	"first probe"
	methodCache at: _gsSqueakTemp_probe + MethodCacheSelector put: messageSelector.
	methodCache
		at: _gsSqueakTemp_probe + MethodCacheClass
		put: (objectMemory classTagForClass: classObj).
	methodCache at: _gsSqueakTemp_probe + MethodCacheMethod put: newMethod.
	methodCache
		at: _gsSqueakTemp_probe + MethodCachePrimFunction
		put: (self cCoerce: primitiveFunctionPointer to: #'sqIntptr_t').
	lastMethodCacheProbeWrite := _gsSqueakTemp_probe.
	"this for primitiveExternalMethod"
	"...and zap the following entries"
	1
		to: CacheProbeMax - 1
		do: [:p | 
			_gsSqueakTemp_probe := _gsSqueakTemp_hash >> p bitAnd: MethodCacheMask.
			methodCache at: _gsSqueakTemp_probe + MethodCacheSelector put: 0]
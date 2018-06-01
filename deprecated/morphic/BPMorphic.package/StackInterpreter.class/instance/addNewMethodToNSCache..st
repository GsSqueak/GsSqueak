method lookup cache
addNewMethodToNSCache: rule 
	| _gsSqueakTemp_classObj _gsSqueakTemp_probe _gsSqueakTemp_hash _gsSqueakTemp_primitiveIndex |
	_gsSqueakTemp_classObj := lkupClass.
	_gsSqueakTemp_hash := (objectMemory methodCacheHashOf: messageSelector with: lkupClassTag)
				bitXor: (method bitXor: rule).
	self deny: rule = LookupRuleOrdinary.
	(objectMemory isOopCompiledMethod: newMethod)
		ifTrue: [_gsSqueakTemp_primitiveIndex := self primitiveIndexOf: newMethod.
			primitiveFunctionPointer := self functionPointerFor: _gsSqueakTemp_primitiveIndex inClass: _gsSqueakTemp_classObj]
		ifFalse: [self assert: ((objectMemory isNonImmediate: newMethod)
					and: [objectMemory isForwarded: newMethod]) not.
			primitiveFunctionPointer := #primitiveInvokeObjectAsMethod].
	0
		to: CacheProbeMax - 1
		do: [:p | 
			_gsSqueakTemp_probe := _gsSqueakTemp_hash >> p bitAnd: NSMethodCacheMask.
			(nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector)
					= 0
				ifTrue: ["Found an empty entry -- use it"
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector put: messageSelector.
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheClassTag put: lkupClassTag.
					"(objectMemory classTagForClass: classObj)."
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheCallingMethod put: method.
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheDepthOrLookupRule put: rule.
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheTargetMethod put: newMethod.
					nsMethodCache
						at: _gsSqueakTemp_probe + NSMethodCachePrimFunction
						put: (self cCoerce: primitiveFunctionPointer to: #'sqIntptr_t').
					nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheActualReceiver put: localAbsentReceiverOrZero.
					"lastMethodCacheProbeWrite := probe."
					"this for primitiveExternalMethod"
					^ self]].
	"OK, we failed to find an entry -- install at the first slot..."
	_gsSqueakTemp_probe := _gsSqueakTemp_hash bitAnd: NSMethodCacheMask.
	"first probe"
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector put: messageSelector.
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheClassTag put: lkupClassTag.
	"(objectMemory classTagForClass: classObj)."
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheCallingMethod put: method.
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheDepthOrLookupRule put: rule.
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheTargetMethod put: newMethod.
	nsMethodCache
		at: _gsSqueakTemp_probe + NSMethodCachePrimFunction
		put: (self cCoerce: primitiveFunctionPointer to: #'sqIntptr_t').
	nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheActualReceiver put: localAbsentReceiverOrZero.
	"lastMethodCacheProbeWrite := probe."
	"this for primitiveExternalMethod"
	"...and zap the following entries"
	1
		to: CacheProbeMax - 1
		do: [:p | 
			_gsSqueakTemp_probe := _gsSqueakTemp_hash >> p bitAnd: NSMethodCacheMask.
			nsMethodCache at: _gsSqueakTemp_probe + NSMethodCacheSelector put: 0]
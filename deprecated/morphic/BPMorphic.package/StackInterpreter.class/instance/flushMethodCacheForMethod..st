method lookup cache
flushMethodCacheForMethod: oldMethod 
	"Flush the method caches of references to oldMethod."
	| _gsSqueakTemp_probe |
	_gsSqueakTemp_probe := 0.
	1
		to: MethodCacheEntries
		do: [:i | 
			(methodCache at: _gsSqueakTemp_probe + MethodCacheMethod)
					= oldMethod
				ifTrue: [methodCache at: _gsSqueakTemp_probe + MethodCacheSelector put: 0].
			_gsSqueakTemp_probe := _gsSqueakTemp_probe + MethodCacheEntrySize].
	self flushExternalPrimitiveOf: oldMethod.
	self flushAtCache
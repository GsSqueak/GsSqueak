method lookup cache
flushMethodCacheFrom: memStart to: memEnd 
	"Flush entries in the method cache only if the oop address is within the
	given memory range. 
	This reduces over-aggressive cache clearing. Note the AtCache is fully
	flushed, 70% of the time 
	cache entries live in newspace, new objects die young"
	| _gsSqueakTemp_probe |
	_gsSqueakTemp_probe := 0.
	1
		to: MethodCacheEntries
		do: [:i | 
			(methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
					= 0
				ifFalse: [((((self
										oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
										isGreaterThanOrEqualTo: memStart)
									and: [self
											oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheSelector)
											isLessThan: memEnd])
								or: [(self
											oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheClass)
											isGreaterThanOrEqualTo: memStart)
										and: [self
												oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheClass)
												isLessThan: memEnd]])
							or: [(self
										oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheMethod)
										isGreaterThanOrEqualTo: memStart)
									and: [self
											oop: (methodCache at: _gsSqueakTemp_probe + MethodCacheMethod)
											isLessThan: memEnd]])
						ifTrue: [methodCache at: _gsSqueakTemp_probe + MethodCacheSelector put: 0]].
			_gsSqueakTemp_probe := _gsSqueakTemp_probe + MethodCacheEntrySize].
	NewspeakVM
		ifTrue: [1
				to: NSMethodCacheSize
				do: [:i | nsMethodCache at: i put: 0]].
	self flushAtCache
debugger support
cacheDebugMap: aDebuggerMethodMap forMethod: aCompiledMethod
	
	^self protected: [ 
		MapCache size >= MapCacheEntries ifTrue: [
			MapCache slowSize >= MapCacheEntries 
				ifFalse: [ MapCache rehash ]
				ifTrue: [
					| mapsByAge |
					mapsByAge := MapCache keys sort: [ :m1 :m2 |
						"We are holding strongly on the keys, so #at: is suitable."
						(MapCache at: m1) timestamp < (MapCache at: m2) timestamp].
					mapsByAge from: 1 to: mapsByAge size - MapCacheEntries do: [ :each |
						MapCache removeKey: each ] ] ].
		MapCache
			at: aCompiledMethod
			put: aDebuggerMethodMap ]
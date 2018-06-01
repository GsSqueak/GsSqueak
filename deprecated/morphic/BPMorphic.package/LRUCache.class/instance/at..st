accessing
at: aKey 
	"answer the object for aKey, if not present in the cache creates it"
	calls := calls + 1.
	^ map
		at: aKey
		ifPresent: [:node | 
			hits := hits + 1.
			head next == node
				ifFalse: [node unlink; linkAfter: head].
			node value]
		ifAbsent: [| node |
			map size = size
				ifTrue: [node := head previous.
					node unlink.
					map removeKey: node key]
				ifFalse: [node := LRUCacheNode new].
			node linkAfter: head.
			map at: aKey put: node.
			node key: aKey;
				
				value: (factory value: aKey);
				 value]
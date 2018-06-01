list operations
linkAfter: anLRUCacheHeadNode 
	next := anLRUCacheHeadNode next.
	previous := anLRUCacheHeadNode.
	next previous: self.
	previous next: self
lookup pools
removeLookupPool: sharedPool 
	"Workspaces should no longer look up bindings in the specified
	SharedPool. "
	LookupPools
		ifNil: [^ self].
	LookupPools
		remove: sharedPool
		ifAbsent: []
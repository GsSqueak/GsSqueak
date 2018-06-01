lookup pools
addLookupPool: sharedPool 
	"Add a SharedPool that bindings should be looked up in."
	LookupPools
		ifNil: [LookupPools := IdentitySet new].
	LookupPools add: sharedPool
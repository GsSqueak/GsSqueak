instance management
instanceDict

	^ InstanceDict ifNil: [InstanceDict := IdentityDictionary new]
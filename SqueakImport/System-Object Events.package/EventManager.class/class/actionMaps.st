accessing
actionMaps

	ActionMaps == nil
		ifTrue: [ActionMaps := WeakIdentityKeyDictionary new].
	^ActionMaps
*EnvironmentsEnv7-configuring
exportAddingPrefix: aString 
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: self
				policy: (AddPrefixNamePolicy prefix: aString)
				addSelector: #notifyObserversOfBindingAdded:
				removeSelector: #notifyObserversOfBindingRemoved:.
	policies := policies copyWith: _gsSqueakTemp_policy

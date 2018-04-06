configuring
exportRemovingPrefix: aString 
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: self
				policy: (RemovePrefixNamePolicy prefix: aString)
				addSelector: #notifyObserversOfBindingAdded:
				removeSelector: #notifyObserversOfBindingRemoved:.
	policies := policies copyWith: _gsSqueakTemp_policy
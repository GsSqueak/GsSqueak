*EnvironmentsEnv7-configuring
exportSelf
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: self
				policy: AllNamePolicy new
				addSelector: #notifyObserversOfBindingAdded:
				removeSelector: #notifyObserversOfBindingRemoved:.
	policies := policies copyWith: _gsSqueakTemp_policy

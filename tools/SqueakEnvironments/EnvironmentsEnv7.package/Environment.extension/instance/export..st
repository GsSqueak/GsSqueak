*EnvironmentsEnv7-configuring
export: spec 
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: self
				policy: (ExplicitNamePolicy spec: spec)
				addSelector: #notifyObserversOfBindingAdded:
				removeSelector: #notifyObserversOfBindingRemoved:.
	policies := policies copyWith: _gsSqueakTemp_policy

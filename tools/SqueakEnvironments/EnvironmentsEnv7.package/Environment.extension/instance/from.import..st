*EnvironmentsEnv7-configuring
from: anEnvironment import: spec 
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: anEnvironment
				policy: (ExplicitNamePolicy spec: spec)
				addSelector: #showBinding:
				removeSelector: #hideBinding:.
	policies := policies copyWith: _gsSqueakTemp_policy.
	anEnvironment addObserver: self.
	anEnvironment addAllBindings

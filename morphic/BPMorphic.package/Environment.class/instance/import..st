configuring
import: anEnvironment 
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: anEnvironment
				policy: AllNamePolicy new
				addSelector: #showBinding:
				removeSelector: #hideBinding:.
	policies := policies copyWith: _gsSqueakTemp_policy.
	anEnvironment addObserver: self.
	anEnvironment addAllBindings
configuring
importSelf
	| _gsSqueakTemp_policy |
	_gsSqueakTemp_policy := BindingPolicy
				environment: self
				policy: AllNamePolicy new
				addSelector: #showBinding:
				removeSelector: #hideBinding:.
	policies := policies copyWith: _gsSqueakTemp_policy.
	declarations
		associationsDo: [:ea | (bindings includesKey: ea key)
				ifFalse: [bindings add: ea]]
*EnvironmentsEnv7-configuring
import: anEnvironment removingPrefix: aString 
	| _gsSqueakTemp_import |
	_gsSqueakTemp_import := BindingPolicy
				environment: anEnvironment
				policy: (RemovePrefixNamePolicy prefix: aString)
				addSelector: #showBinding:
				removeSelector: #hideBinding:.
	policies := policies copyWith: _gsSqueakTemp_import.
	anEnvironment addObserver: self.
	anEnvironment addAllBindings

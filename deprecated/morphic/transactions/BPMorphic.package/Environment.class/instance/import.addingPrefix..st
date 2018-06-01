configuring
import: anEnvironment addingPrefix: aString 
	| _gsSqueakTemp_import |
	_gsSqueakTemp_import := BindingPolicy
				environment: anEnvironment
				policy: (AddPrefixNamePolicy prefix: aString)
				addSelector: #showBinding:
				removeSelector: #hideBinding:.
	policies := policies copyWith: _gsSqueakTemp_import.
	anEnvironment addObserver: self.
	anEnvironment addAllBindings
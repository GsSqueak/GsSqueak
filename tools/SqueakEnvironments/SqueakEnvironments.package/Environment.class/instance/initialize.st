initialize-release
initialize
	declarations := IdentityDictionary new.
	bindings := IdentityDictionary new.
	undeclared := WeakIdentityDictionary new.
	policies := Array new.
	observers := IdentitySet new
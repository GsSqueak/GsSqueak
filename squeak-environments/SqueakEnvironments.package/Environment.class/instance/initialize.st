initialize-release
initialize
  Smalltalk at: #'SqueakEnvironment' put: nil.
  declarations := IdentityDictionary new.
  bindings := IdentityDictionary new.
  undeclared := WeakIdentityDictionary new.
  policies := Array new.
  observers := IdentitySet new
class initialization
initialize

	QuadByteSymbol _env0 superclassForEnv: 7 put: self.
	QuadByteSymbol class _env0 superclassForEnv: 7 put: self class.

	DoubleByteSymbol _env0 superclassForEnv: 7 put: self.
	DoubleByteSymbol class _env0 superclassForEnv: 7 put: self class.

	Behavior _env0 _clearLookupCaches: 7.
	Behavior _env0 _clearLookupCaches: 0.

	Smalltalk removeFromShutDownList: self. "@@@ Remove this later @@@"

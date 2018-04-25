initialization
initialize

	QuadByteString _env0 superclassForEnv: 7 put: self.
	QuadByteString class _env0 superclassForEnv: 7 put: self class.

	DoubleByteString _env0 superclassForEnv: 7 put: self.
	DoubleByteString class _env0 superclassForEnv: 7 put: self class.

	Behavior _env0 _clearLookupCaches: 7.
	Behavior _env0 _clearLookupCaches: 0.


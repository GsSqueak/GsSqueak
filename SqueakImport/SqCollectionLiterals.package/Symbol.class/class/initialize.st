class initialization
initialize

	ByteSymbol _env0 superclassForEnv: 7 put: self.
	ByteSymbol class _env0 superclassForEnv: 7 put: self class.
	Behavior _env0 _clearLookupCaches: 7.
	Behavior _env0 _clearLookupCaches: 0.

	"Symbol initialize"

	Symbol rehash.
	Smalltalk addToShutDownList: self.

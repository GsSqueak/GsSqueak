*SqClasses-accessing class hierarchy
superclass: aClass 
	"Change the receiver's superclass to be aClass."
	"Note: Do not use 'aClass isKindOf: Behavior' here
		in case we recompile from Behavior itself."
	(aClass == nil or: [aClass isBehavior]) ifTrue: [
		self _env0 superclassForEnv: 7 put: aClass.
		self class _env0 superclassForEnv: 7 put: aClass class.
		Behavior _env0 _clearLookupCaches: 7.
		Behavior _env0 _clearLookupCaches: 0]

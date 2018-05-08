bindings
beBindingOfType: aClass announcing: aBool
	"Make the receiver a global binding of the given type"

	self class == aClass ifTrue:[^self].
	self becomeForward: (aClass key: self key value: self value).
	"NOTE: Now self == read-only (e.g., the new binding)"
	^self recompileBindingsAnnouncing: aBool

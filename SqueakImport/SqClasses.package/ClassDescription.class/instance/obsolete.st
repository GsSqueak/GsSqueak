*SqClasses-initialize-release
obsolete
	"Make the receiver obsolete."
	self hasTraitComposition ifTrue: [
		self traitComposition do: [:each |
			each removeTraitUser: self]].
	superclass removeSubclass: self.
	self organization: nil.
	super obsolete.

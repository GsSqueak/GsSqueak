copying
veryDeepInner: deepCopier
	"ALL fields are weakly copied!  Can't duplicate an object by duplicating a button that activates it.  See DeepCopier."

	super veryDeepInner: deepCopier.
	"just keep old pointers to all fields"

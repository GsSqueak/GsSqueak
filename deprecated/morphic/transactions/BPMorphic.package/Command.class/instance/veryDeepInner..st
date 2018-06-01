copying
veryDeepInner: deepCopier 
	"ALL fields are weakly copied! Can't duplicate an object by duplicating
	a Command that involves it. See DeepCopier."
	super veryDeepInner: deepCopier.
	"just keep old pointers to all fields"
	parameters := parameters
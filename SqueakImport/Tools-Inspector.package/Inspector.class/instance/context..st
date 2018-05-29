accessing
context: ctxt
	"Set the context of inspection. Currently only used by my subclass ClosureEnvInspector. The inst var is here because we do primitiveChangeClassTo: between subclasses (see inspect:) between different subclasses, but also context could be used as a general concept in all inspectors"

	context := ctxt
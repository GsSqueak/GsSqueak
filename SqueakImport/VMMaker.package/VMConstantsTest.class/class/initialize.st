class initialization
initialize
	"The method added May 2011 to force a recompile for VMMaker loaded through
	the update stream. Recompile is required due to earlier move of class variables
	into shared pools, because existing compiled methods held references to original
	class variables. This method should be removed within about a year, as it serves
	no purpose except to clean up the update stream."
	
	self flag: #FIXME. "delete this method"

	ObjectMemory allSubclasses do: [:cls | cls compileAll]

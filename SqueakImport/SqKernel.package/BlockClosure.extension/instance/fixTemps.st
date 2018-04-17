*SqKernel-private
fixTemps
	"Fix the values of the temporary variables used in the block that
	 are  ordinarily shared with the method in which the block is defined.
	 This is a no-op for closures, provided for backward-compatibility with
	 old BlockContexts that needed the fixTemps hack to persist."


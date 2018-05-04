initialization
initializeMiscConstantsWith: optionsDictionary
	"Falsify the `what type of VM is this?' flags that are defined in the various interp.h files,
	 or in the case of VMBIGENDIAN the various sqConfig.h files.
	 Subclass implementations need to include a super initializeMiscConstantsWith:."

	"moved to StackInterpreter -dtl"
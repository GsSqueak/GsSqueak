initialization
initialize
	"StackInterpreter initialize"

	"Copied in part from VMClass class>>initializeMiscConstantsWith:"

	"Falsify the `what type of VM is this?' flags that are defined in the various interp.h files,
	 or in the case of VMBIGENDIAN the various sqConfig.h files.
	 Subclass implementations need to include a super initializeMiscConstantsWith:."

	BytesPerWord := 4.
	VMBIGENDIAN := false.	"Intel"
	VMBIGENDIAN class. "Mention this for the benefit of CCodeGenerator>>emitCConstantsOn:"
	STACKVM := COGVM := COGMTVM := false.
	IMMUTABILITY := NewspeakVM := false.
	MULTIPLEBYTECODESETS := false.

	NewspeakVM := false.
	self initializeWithOptions: Dictionary new.

initialization
initializeConstants
	"ObjectMemory initializeConstants"

	self initializeObjectWordConstants.

	"Translation flags (booleans that control code generation via conditional translation):"
	DoAssertionChecks := false.  "generate assertion checks"

	self initializeSpecialObjectIndices.
	self initializeObjectHeaderConstants.

	CtxtTempFrameStart := 6.  "Copy of TempFrameStart in Interp"
	ContextFixedSizePlusHeader := CtxtTempFrameStart + 1.
	
	LargeContextBit := 16r40000.  "This bit set in method headers if large context is needed."
	NilContext := 1.  "the oop for the integer 0; used to mark the end of context lists"

	RemapBufferSize := 25.
	RootTableSize := 2500.  	"number of root table entries (4 bytes/entry)"
	RootTableRedZone := RootTableSize - 100.	"red zone of root table - when reached we force IGC"

	"tracer actions"
	StartField := 1.
	StartObj := 2.
	Upward := 3.
	Done := 4.

	ExtraRootSize := 2048. "max. # of external roots"
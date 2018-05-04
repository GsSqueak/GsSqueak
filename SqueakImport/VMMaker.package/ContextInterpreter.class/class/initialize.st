initialization
initialize
	"Interpreter initialize"

	super initialize.  "initialize ObjectMemory constants"
	self initializeAssociationIndex.
	self initializeBytecodeTable.
	self initializeCaches.
	self initializeCharacterIndex.
	self initializeCharacterScannerIndices.
	self initializeClassIndices.
	self initializeCompilerHooks.
	self initializeContextIndices.
	self initializeDirectoryLookupResultCodes.
	self initializeMessageIndices.
	self initializeMethodIndices.
	self initializePointIndices.
	self initializePrimitiveTable.
	self initializeSchedulerIndices.
	self initializeStreamIndices.
	self initializeInterpreterSourceVersion.

	PrimitiveExternalCallIndex := 117. "Primitive index for #primitiveExternalCall"
	MillisecondClockMask := 16r1FFFFFFF.

	MaxJumpBuf := 32. "max. callback depth"

	"Translation flags (booleans that control code generation via conditional translation):"
	DoBalanceChecks := false. "generate stack balance checks"

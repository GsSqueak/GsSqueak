initialization
initialize
	"ObjectMemory initialize"

	self initializeConstants.
	self initializePrimitiveErrorCodes.
	self initializeCompactClassIndices.
	self initializePrimitiveErrorCodes.
	self initializeSmallIntegers.

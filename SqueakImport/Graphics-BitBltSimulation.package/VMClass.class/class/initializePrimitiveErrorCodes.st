initialization
initializePrimitiveErrorCodes
	"Define the VM's primitive error codes. N.B. these are
	replicated in platforms/Cross/vm/sqVirtualMachine.h."
	"VMClass initializePrimitiveErrorCodes"
	| _gsSqueakTemp_pet |
	PrimErrTableIndex := 51.
	"Zero-relative"
	"See SmalltalkImage>>recreateSpecialObjectsArray for the table
	definition. If the table exists and is large enough the corresponding
	entry is returned as
	the primitive error, otherwise the error is answered numerically."
	_gsSqueakTemp_pet := Smalltalk specialObjectsArray
				at: PrimErrTableIndex + 1
				ifAbsent: [#()].
	_gsSqueakTemp_pet isArray
		ifFalse: [_gsSqueakTemp_pet := #()].
	PrimNoErr := 0.
	"for helper methods that need to answer success or an error code."
	PrimErrGenericFailure := _gsSqueakTemp_pet indexOf: nil ifAbsent: 1.
	PrimErrBadReceiver := _gsSqueakTemp_pet indexOf: #'bad receiver' ifAbsent: 2.
	PrimErrBadArgument := _gsSqueakTemp_pet indexOf: #'bad argument' ifAbsent: 3.
	PrimErrBadIndex := _gsSqueakTemp_pet indexOf: #'bad index' ifAbsent: 4.
	PrimErrBadNumArgs := _gsSqueakTemp_pet indexOf: #'bad number of arguments' ifAbsent: 5.
	PrimErrInappropriate := _gsSqueakTemp_pet indexOf: #'inappropriate operation' ifAbsent: 6.
	PrimErrUnsupported := _gsSqueakTemp_pet indexOf: #'unsupported operation' ifAbsent: 7.
	PrimErrNoModification := _gsSqueakTemp_pet indexOf: #'no modification' ifAbsent: 8.
	PrimErrNoMemory := _gsSqueakTemp_pet indexOf: #'insufficient object memory' ifAbsent: 9.
	PrimErrNoCMemory := _gsSqueakTemp_pet indexOf: #'insufficient C memory' ifAbsent: 10.
	PrimErrNotFound := _gsSqueakTemp_pet indexOf: #'not found' ifAbsent: 11.
	PrimErrBadMethod := _gsSqueakTemp_pet indexOf: #'bad method' ifAbsent: 12.
	PrimErrNamedInternal := _gsSqueakTemp_pet indexOf: #'internal error in named primitive machinery' ifAbsent: 13.
	PrimErrObjectMayMove := _gsSqueakTemp_pet indexOf: #'object may move' ifAbsent: 14.
	PrimErrLimitExceeded := _gsSqueakTemp_pet indexOf: #'resource limit exceeded' ifAbsent: 15.
	PrimErrObjectIsPinned := _gsSqueakTemp_pet indexOf: #'object is pinned' ifAbsent: 16.
	PrimErrWritePastObject := _gsSqueakTemp_pet indexOf: #'primitive write beyond end of object' ifAbsent: 17.
	PrimErrObjectMoved := _gsSqueakTemp_pet indexOf: #'object moved' ifAbsent: 18.
	PrimErrObjectNotPinned := _gsSqueakTemp_pet indexOf: #'object not pinned' ifAbsent: 19.
	PrimErrCallbackError := _gsSqueakTemp_pet indexOf: #'error in callback' ifAbsent: 20.
	PrimErrOSError := _gsSqueakTemp_pet indexOf: #'operating system error' ifAbsent: 21
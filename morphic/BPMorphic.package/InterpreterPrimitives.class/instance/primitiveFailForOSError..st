primitive support
primitiveFailForOSError: osError 
	"Set PrimErrOSError primitive failure and associated osErrorCode."
	osErrorCode := osError.
	^ primFailCode := PrimErrOSError
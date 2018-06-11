API - transactions
GciTsAbort: session err: error
"/*================================================
 *  GciTsAbort
 *  Abort the specified session.
 *  Implemented in client library as message send
 */"
	<cdecl: bool 'GciTsAbort' (GciSessionType* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(BoolType) GciTsAbort(
	GciSession sess,
	GciErrSType *err);"
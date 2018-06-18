API - transactions
GciTsBegin: session err: error
"/*================================================
 *  GciTsBegin
 *  Begin a new transaction.
 *  Implemented in client library as message send
 */"
	<cdecl: bool 'GciTsBegin' (GciSessionType* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(BoolType) GciTsBegin(
	GciSession sess,
	GciErrSType *err);"
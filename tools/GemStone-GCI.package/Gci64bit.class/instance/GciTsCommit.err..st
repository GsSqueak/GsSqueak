API - transactions
GciTsCommit: session err: error
"/*================================================
 *  GciTsCommit
 *  Commit the specified session.  
 *  Implemented in client library as message send
 */"
	<cdecl: bool 'GciTsCommit' (GciSessionType* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(BoolType) GciTsCommit(
	GciSession sess,
	GciErrSType *err);"
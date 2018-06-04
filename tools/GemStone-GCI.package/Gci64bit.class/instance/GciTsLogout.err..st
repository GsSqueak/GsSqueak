API
GciTsLogout: session err: error
"/*================================================
 *  GciTsLogout
 *  Logout the session.
 *  If the return value is FALSE, an error is returned in *err.
 */"
	<cdecl: bool 'GciTsLogout' (GciSessionType* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(BoolType) GciTsLogout(GciSession sess, GciErrSType *err);"
API
GciTsReleaseObjs: session a: buffer a: count err: error
"/*================================================
 *  GciTsReleaseObjs
 *
 *  result TRUE if buf completely processed, FALSE if error returned in *err
 *  the inverse of GciTsSaveObjs
 */"
	<cdecl: bool 'GciTsReleaseObjs' (GciSessionType* ulonglong* long GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(BoolType) GciTsReleaseObjs(
	GciSession sess,
	OopType *buf,
	int count,
	GciErrSType *err);"
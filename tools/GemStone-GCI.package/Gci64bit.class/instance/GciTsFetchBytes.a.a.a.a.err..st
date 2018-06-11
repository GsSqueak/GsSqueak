API
GciTsFetchBytes: session a: theObject a: startIndex a: dest a: numBytes err: error
"/*================================================
 *  GciTsFetchBytes
 *
 *  function result is number of bytes returned in *dest or
 *  -1 if an error was returned in *err . *dest is undefined if
 *  result is -1.
 *  numBytes must be >= 0
 */"
	<cdecl: longlong 'GciTsFetchBytes' (GciSessionType* ulonglong longlong char* longlong GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(int64) GciTsFetchBytes(
	GciSession sess,
	OopType theObject,
	int64 startIndex,
	ByteType *dest,
	int64 numBytes,
	GciErrSType *err );"
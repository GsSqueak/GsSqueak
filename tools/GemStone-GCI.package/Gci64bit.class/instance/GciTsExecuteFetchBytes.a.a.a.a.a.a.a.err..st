API
GciTsExecuteFetchBytes: session a: sourceStr a: sourceSize a: sourceOop a: contextObject a: symbolList a: result a: maxResultSize err: error
"/*================================================
 *  GciTsExecuteFetchBytes
 *
 *  variant of GciTsExecute_ which assumes that the execution result is
 *  a byte format object, usually an instance of String or Utf8 .
 *  The body of the result object is fetched into *result,
 *  and function result is number of bytes returned, or -1 if an error
 *  was returned in *err .
 *  Execution is in environment 0 using GCI_PERFORM_FLAG_ENABLE_DEBUG.
 */"
	<cdecl: longlong 'GciTsExecuteFetchBytes' (GciSessionType* char* longlong ulonglong ulonglong ulonglong char* longlong GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(ssize_t) GciTsExecuteFetchBytes(
		GciSession sess,
		const char* sourceStr,
		ssize_t sourceSize,
		OopType sourceOop,
		OopType contextObject,
		OopType symbolList,
		ByteType *result,
		ssize_t maxResultSize,
		GciErrSType *err);"
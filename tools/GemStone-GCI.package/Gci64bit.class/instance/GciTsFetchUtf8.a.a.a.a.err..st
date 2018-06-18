API
GciTsFetchUtf8: session a: obj a: dest a: destSize a: requiredSize err: error
"/*================================================
 *  GciTsFetchUtf8
 *
 *  class of obj must be a identical to or a subclass of 
 *  String, DoubleByteString, or Unicode32 or Utf8 .
 *  *dest will be filled with UTF-8 encoded Characters . 
 *  Returns -1 if an error was returned in *err , otherwise
 *  returns the number of bytes stored starting at *dest,
 *  excluding the zero terminator byte.
 *  Returns in *requiredSize the number of  bytes required
 *  to hold the complete result, including a terminator byte of zero.
 *  If *requiredSize is > destSize, then *dest contains an incomplete
 *  result not terminated with a zero byte.
 */"
	<cdecl: longlong 'GciTsFetchUtf8' (GciSessionType* ulonglong char* longlong longlong* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(int64) GciTsFetchUtf8(
	GciSession sess,
	OopType obj,
	ByteType *dest,
	int64 destSize,
	int64 *requiredSize,
	GciErrSType *err );"
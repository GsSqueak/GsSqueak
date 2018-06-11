API
GciTsFetchUtf8Bytes: session a: theObject a: startIndex a: theBytes a: numBytes a: ofClass err: error
"/*================================================
 *  GciTsFetchUtf8Bytes  
 *  
 *  class of aString must be a identical to or a subclass of
 *  String, MultiByteString or Utf8 .
 *  If aString is an instance of Utf8 , or a kind of String with
 *  all codePoints <= 127, *utf8String will be unchanged and behavior
 *  is the same as GciTsFetchBytes_ .  Note that the result buffer
 *  contains bytes and may not start or end at codePoint boundaries
 *  within an instance of Utf8 .
 *
 *  If aString is a kind of String or MultiByteString with codePoints
 *  above 127,  and startIndex == 1 then
 *  aString is sent encodeAsUTF8 and the result added to the export
 *  set and returned in *utf8String.
 *  Then bytes are fetched from *utf8String as for GciTsFetchBytes_ ,
 *  up to a maximum of bufSize. 
 *
 *  startIndex represents a byte offset into the Utf8 encoded result.
 *  If the function result == bufSize , then additional calls 
 *  with startIndex values of  bufSize*1, bufSize*2,  etc are needed
 *  to obtain the complete result.

 *  The caller should pass *utf8String to GciTsReleaseObjs
 *  after fetching all the bytes desired.
 *
 *  flags argument accepts these values
 *     0 = normal fetch 
 *     1 = substitute '.' for illegal codePoints
 *     2 = generate description in *buf instead of signalling an error
 *        when an illegal code point in aString prevents conversion to UTF8.
 *
 *  Returns -1 if an error was returned in *err , otherwise
 *  returns the number of bytes stored starting at *dest .
 *  There is no terminator zero included in *dest .
 */"
	<cdecl: longlong 'GciTsFetchUtf8Bytes' (GciSessionType* ulonglong longlong char* longlong ulonglong* GciErrSType64*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(int64) GciTsFetchUtf8Bytes(
	GciSession sess,
	OopType aString,
	int64 startIndex,
	ByteType *dest,
	int64 bufSize,
	OopType *utf8String,
	GciErrSType *err,
	int flags = 0);"
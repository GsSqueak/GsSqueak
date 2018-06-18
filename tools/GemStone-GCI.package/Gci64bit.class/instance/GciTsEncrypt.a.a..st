API - utility
GciTsEncrypt: password a: outBuf a: outBuffSize
"/*================================================
 *  GciTsEncrypt
 *  Encrypts the clear text 'password'. Puts the encrypted form in
 *  outBuff and returns a pointer to the first character.
 *  Returns NULL if outBuff is not large enough.
 */"
	<cdecl: bool 'GciTsEncrypt' (char* char* ulonglong)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(char*) GciTsEncrypt(
	const char* password,
	char *outBuf,
	size_t outBuffSize);"
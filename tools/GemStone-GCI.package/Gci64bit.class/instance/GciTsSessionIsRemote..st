API - utility
GciTsSessionIsRemote: session
"/*================================================
 *  GciTsSessionIsRemote
 *  Determinie if the given session is linked or RPC. 
 *  -1 indicates session is not valid, 0 is linked, and 1 is RPC. 
 *  Will not return 0 since linked sessions not currently supported
 */"
	<cdecl: ulonglong 'GciTsSessionIsRemote' (GciSessionType*)>
	^ self externalCallFailed
"EXTERN_GCI_DEC(int) GciTsSessionIsRemote(
	GciSession sess);"
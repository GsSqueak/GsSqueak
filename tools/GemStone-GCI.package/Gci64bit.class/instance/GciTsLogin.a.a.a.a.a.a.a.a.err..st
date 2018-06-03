API
GciTsLogin: stoneNameNrs a: hostUserId a: hostPassword a: hostPwIsEncrypted a: gemServiceNrs a: gemstoneUsername a: gemstonePassword a: loginFlags a: haltOnErrNum err: err
"/*================================================
 *  GciTsLogin 
 *  Create a new session.  A netldi is contacted per the NRS GemService, and 
 *  optionally using HostUserId, HostPassword  to fork a gem process.
 *  Then the gem logs into the repository using StoneNameNrs, gemstoneUsername,
 *  gemstonePassword .
 *  Returns NULL if an error occurred, with details in *err .
 *  If result is non-NULL, login succeeded but there may still be a warning in *err .
 *  GCI_LOGIN_IS_SUBORDINATE bit in loginFlags is not allowed .
 *  'gcilnkobj' value for GemService is not allowed .
 *  GCI_LOGIN_PW_ENCRYPTED bit in loginFlags applies to gemstonePassword argument.
 *  haltOnErrNum, if non zero, specifes a value for GEM_HALT_ON_ERROR config parameter.
 *  Use GciTsEncrypt to encrypt passwords prior to calling GciTsLogin.
 *  If GemServiceNrs is NULL, the default '!@localhost!gemnetobject' is used .
 *  If StoneNameNrs is NULL, the default 'gs64stone' is used
 *  HostUserId may be NULL if gem process is to run using the userId of the
 *  netldi  process .
 *
 *  Note, there are no equivalents to GciInit nor GciShutdown in the thread-safe GCI.
 *  The GciTsLogin function initializes all of the state related to the returned session
 *  and GciTsLogout will deallocate the specified session.
 */"
	<cdecl: GciSessionType 'GciTsLogin' (char* char* char* bool char* char* char* ulong long GciErrSType64)>
	^ self externalCallFailed
	
"EXTERN_GCI_DEC(GciSession) GciTsLogin(
    const char *StoneNameNrs,
    const char *HostUserId, 
    const char *HostPassword,
    BoolType hostPwIsEncrypted,
    const char *GemServiceNrs,
    const char *gemstoneUsername,
    const char *gemstonePassword,
    unsigned int loginFlags /* per GCI_LOGIN* in gci.ht */ ,
    int haltOnErrNum,
    GciErrSType *err);"
API
GciTsLogin: stoneNameNrs a: hostUserId a: hostPassword a: hostPwIsEncrypted a: gemServiceNrs a: gemstoneUsername a: gemstonePassword a: loginFlags a: haltOnErrNum err: err

	<cdecl: GciSessionType 'GciTsLogin' (char* char* char* bool char* char* char* ulong long GciErrSType64)>
	^ self externalCallFailed
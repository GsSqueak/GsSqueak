private
printStateOn: stream
	"Print the current state of myself onto stream.
	Used to gather information in the debug log."

	stream
		nextPutAll: 'SecurityManager state:'; cr;
		nextPutAll: 'Restricted: '; nextPutAll: self isInRestrictedMode asString; cr;
		nextPutAll: 'FileAccess: '; nextPutAll: self hasFileAccess asString; cr;
		nextPutAll: 'SocketAccess: '; nextPutAll: self hasSocketAccess asString; cr;
		nextPutAll: 'Working Dir '; nextPutAll: FileDirectory default pathName asString; cr;
		nextPutAll: 'Trusted Dir '; nextPutAll: self secureUserDirectory asString; cr;
		nextPutAll: 'Untrusted Dir '; nextPutAll: self untrustedUserDirectory asString; cr;
		cr
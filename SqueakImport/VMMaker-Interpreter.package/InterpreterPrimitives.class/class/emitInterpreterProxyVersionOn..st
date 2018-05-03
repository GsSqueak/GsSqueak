api version
emitInterpreterProxyVersionOn: aStream
	"Specify the version level that corresponds to this interpreter. External
	support code may define additional functions that are not supported by
	this interpreter. "
	aStream
		nextPutAll: '#define VM_PROXY_MAJOR '; print: self vmProxyMajorVersion; cr;
		nextPutAll: '#define VM_PROXY_MINOR '; print: self vmProxyMinorVersion; cr; cr
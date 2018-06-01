accessing
printOn: aStrm
	aStrm nextPutAll: self class name; nextPut: $<.
	aStrm nextPutAll: self moniker.
	aStrm nextPut: $>.

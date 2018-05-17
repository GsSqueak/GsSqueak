security operations
signFile: fileName directory: fileDirectory
	"Sign the given project in the directory"
	| bytes file dsa hash sig key |
	Preferences signProjectFiles ifFalse:[^self]. "signing turned off"
	key := self signingKey.
	key ifNil:[^self].
	file := FileStream readOnlyFileNamed: (fileDirectory fullNameFor: fileName).
	bytes := file binary; contentsOfEntireFile.
	fileDirectory deleteFileNamed: fileName ifAbsent:[].
	dsa := DigitalSignatureAlgorithm new.
	dsa initRandom: Time millisecondClockValue + Date today julianDayNumber.
	hash := SecureHashAlgorithm new hashStream: (ReadStream on: bytes).
	sig := dsa computeSignatureForMessageHash: hash privateKey: key.
	file := FileStream newFileNamed: (fileDirectory fullNameFor: fileName).
	file binary.
	"store a header identifying the signed file first"
	file nextPutAll: 'SPRJ' asByteArray.
	"now the signature"
	file 
		nextPutAll: (sig first withAtLeastNDigits: 20); 
		nextPutAll: (sig last withAtLeastNDigits: 20).
	"now the contents"
	file nextPutAll: bytes.
	file close.
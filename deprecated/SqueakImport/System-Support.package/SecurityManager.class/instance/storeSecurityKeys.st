fileIn/out
storeSecurityKeys
	"SecurityManager default storeSecurityKeys"
	"Store the keys file for the current user"
	| fd loc file |
	self isInRestrictedMode ifTrue:[^self]. "no point in even trying"
	loc := self secureUserDirectory. "where to put it"
	loc last = FileDirectory pathNameDelimiter ifFalse:[
		loc := loc copyWith: FileDirectory pathNameDelimiter.
	].
	fd := FileDirectory on: loc.
	fd assureExistence.
	fd deleteFileNamed: self keysFileName ifAbsent:[].
	file := fd newFileNamed: self keysFileName.
	{privateKeyPair. trustedKeys} storeOn: file.
	file close.
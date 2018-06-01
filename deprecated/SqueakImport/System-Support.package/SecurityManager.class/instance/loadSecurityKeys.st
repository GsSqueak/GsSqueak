fileIn/out
loadSecurityKeys
	"SecurityManager default loadSecurityKeys"
	"Load the keys file for the current user"
	| fd loc file keys |
	self isInRestrictedMode ifTrue:[^self]. "no point in even trying"
	loc := self secureUserDirectory. "where to get it from"
	loc last = FileDirectory pathNameDelimiter ifFalse:[
		loc := loc copyWith: FileDirectory pathNameDelimiter.
	].
	fd := FileDirectory on: loc.
	file := [fd readOnlyFileNamed: keysFileName] 
			on: FileDoesNotExistException do:[:ex| nil].
	file ifNil:[^self]. "no keys file"
	keys := Object readFrom: file.
	privateKeyPair := keys first.
	trustedKeys := keys last.
	file close.
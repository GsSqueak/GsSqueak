security operations
fileInObjectAndCode: aStream
	| trusted |
	trusted := self positionToSecureContentsOf: aStream.
	trusted ifFalse:[self enterRestrictedMode ifFalse:[
		aStream close.
		^nil]].
	^aStream fileInObjectAndCode
simulation support
getenv: aByteStringOrByteArray 
	self halt.
	ec == #'bad argument'
		ifTrue: [aByteStringOrByteArray isString
				ifFalse: [^ self getenv: aByteStringOrByteArray asString]].
	self primitiveFail
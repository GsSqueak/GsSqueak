*SqClasses-testing
isLongs
	self _env0 isBytes _env0 ifFalse: [^ false].
	^ ((self _env0 format _env0 bitShift: -31) _env0 bitAnd: 3) == 3

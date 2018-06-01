accessing
floatAt: index put: value 
	"For simulation only"
	self halt.
	value isFloat
		ifTrue: [self basicAt: index put: value asIEEE32BitWord]
		ifFalse: [self at: index put: value asFloat].
	^ value
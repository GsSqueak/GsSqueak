debugging
debugSyntaxError: anError
	"Handle a syntax error"
	self default ifNil:[^self debugError: anError]. "handle as usual error"
	^self default debugSyntaxError: anError
debugging
debugError: anError
	"Handle an otherwise unhandled error"
	self default ifNil:[ | ctx |
		Smalltalk 
			logSqueakError: anError description 
			inContext: (ctx := anError signalerContext) .
		self inform: (anError description, String cr, ctx shortStack).
		^anError return].
	^self default debugError: anError
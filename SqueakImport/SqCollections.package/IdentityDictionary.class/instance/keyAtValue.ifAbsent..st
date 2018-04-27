accessing
keyAtValue: value ifAbsent: exceptionBlock
	"Answer the key that is the external name for the argument, value. If 
	there is none, answer the result of evaluating exceptionBlock."
 
	^self keyAtIdentityValue: value ifAbsent: exceptionBlock
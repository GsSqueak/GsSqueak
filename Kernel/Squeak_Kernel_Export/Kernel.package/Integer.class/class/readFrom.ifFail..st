instance creation
readFrom: aStringOrStream ifFail: aBlock
	"Answer an instance of one of the concrete subclasses if Integer. 
	Initial plus or minus sign accepted.
	Imbedded radix specifiers not allowed;  use Number class readFrom: for that.
	Execute aBlock if there are no digits."

	^(ExtendedNumberParser on: aStringOrStream) nextIntegerBase: 10 ifFail: aBlock
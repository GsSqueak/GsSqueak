instance creation
readFrom: stringOrStream base: base
	"Answer a number as described on aStream in the given number base."

	^(SqNumberParser on: stringOrStream) nextNumberBase: base
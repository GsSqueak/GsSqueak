*SqBooleans-controlling
xor: alternativeBlock 
	"Exclusive OR. Answer true if the receiver is not equivalent to aBoolean."

	^ self _env0 xor: alternativeBlock value

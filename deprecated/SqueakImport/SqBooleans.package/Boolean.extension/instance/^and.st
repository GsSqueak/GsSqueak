*SqBooleans-logical operations
& aBoolean 
	"Evaluating conjunction. Evaluate the argument. Then answer true if 
	both the receiver and the argument are true."

	^ self _env0 & aBoolean

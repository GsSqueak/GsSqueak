*SqClasses-*SqClasses-*SqClasses-image
wordSize
	"Answer the size in bytes of an object pointer or word in the object memory.
	The value does not change for a given image, but may be modified by a SystemTracer
	when converting the image to another format. The value is cached in WordSize to
	avoid the performance overhead of repeatedly consulting the VM."

	"Smalltalk wordSize"

	^ WordSize ifNil: [WordSize := [self vmParameterAt: 40] on: Error do: [4]]

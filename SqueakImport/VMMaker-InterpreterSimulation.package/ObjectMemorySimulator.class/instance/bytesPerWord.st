memory access
bytesPerWord
	"BytesPerWord was a class variable in ObjectMemory, permitting each object
	memory to have its own word size."

	^ bytesPerWord ifNil: [bytesPerWord := 4]
initialization
initializeWithByteSize: byteSize "<Integer>" for: anInterpreter "<StackInterpreter>" "^<Array of: <Integer>"
	"Initialize the stackPages memory for simulation."
	<doNotGenerate>
	interpreter := anInterpreter.
	^stackMemory := Array new: byteSize / self bytesPerWord withAll: 0
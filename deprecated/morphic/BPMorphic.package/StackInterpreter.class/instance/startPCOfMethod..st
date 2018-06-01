compiled methods
startPCOfMethod: aCompiledMethod 
	"Zero-relative version of CompiledMethod>>startpc."
	^ (objectMemory literalCountOf: aCompiledMethod)
		+ LiteralStart * objectMemory bytesPerOop
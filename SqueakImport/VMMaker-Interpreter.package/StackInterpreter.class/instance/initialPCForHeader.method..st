compiled methods
initialPCForHeader: methodHeader method: theMethod
	^theMethod + ((LiteralStart + (self literalCountOfHeader: methodHeader)) * objectMemory bytesPerWord) + objectMemory baseHeaderSize
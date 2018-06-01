compiled methods
literalCountOfAlternateHeader: headerPointer 
	^ (objectMemory integerValueOf: headerPointer)
		bitAnd: AlternateHeaderNumLiteralsMask
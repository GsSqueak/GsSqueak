primitive support
asUnsigned: anInteger 
	^ self
		cCode: [anInteger asUnsignedInteger]
		inSmalltalk: [anInteger bitAnd: objectMemory maxCInteger]
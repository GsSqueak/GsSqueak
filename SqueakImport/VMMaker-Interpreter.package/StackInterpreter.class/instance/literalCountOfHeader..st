compiled methods
literalCountOfHeader: headerPointer
	<api>
	^(headerPointer >> 10) bitAnd: 16rFF
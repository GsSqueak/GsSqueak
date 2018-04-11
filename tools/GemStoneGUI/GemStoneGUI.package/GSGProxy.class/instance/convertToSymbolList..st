deserializing
convertToSymbolList: aString

	^ aString lines collect: [:line | line withBlanksTrimmed asSymbol]
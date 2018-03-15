parsing topaz output
convertToSymbolList: topazOutput

	^ topazOutput lines collect: [:line | line withBlanksTrimmed asSymbol]
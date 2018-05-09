as yet unclassified
scopedSymbolBinding: aSymbol 
	^ (self symbolBinding: aSymbol)
		ifNil: [(self parent
				ifNil: [^ nil])
				scopedSymbolBinding: aSymbol]
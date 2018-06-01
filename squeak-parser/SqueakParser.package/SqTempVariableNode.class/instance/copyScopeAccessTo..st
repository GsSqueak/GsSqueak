closure analysis
copyScopeAccessTo: aTempVar 
	"For absorbHoistedTemp:, copy the receiver's reads and writes into the
	record in aTempVar."
	readingScopes
		ifNotNil: [readingScopes
				keysAndValuesDo: [:scopeBlock :reads | reads
						do: [:location | aTempVar addReadWithin: scopeBlock at: location
							"<BlockNode>"]]].
	writingScopes
		ifNotNil: [writingScopes
				keysAndValuesDo: [:scopeBlock :writes | writes
						do: [:location | aTempVar addWriteWithin: scopeBlock at: location
							"<BlockNode>"]]]
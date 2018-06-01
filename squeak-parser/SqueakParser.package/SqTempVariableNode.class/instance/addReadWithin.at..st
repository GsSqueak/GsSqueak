closure analysis
addReadWithin: scopeBlock at: location 
	"<BlockNode>"
	"<Integer>"
	readingScopes
		ifNil: [readingScopes := Dictionary new].
	(readingScopes
		at: scopeBlock
		ifAbsentPut: [Set new])
		add: location.
	remoteNode
		ifNotNil: [remoteNode addReadWithin: scopeBlock at: location]
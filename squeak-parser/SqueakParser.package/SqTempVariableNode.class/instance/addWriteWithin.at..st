closure analysis
addWriteWithin: scopeBlock at: location 
	"<BlockNode>"
	"<Integer>"
	writingScopes
		ifNil: [writingScopes := Dictionary new].
	(writingScopes
		at: scopeBlock
		ifAbsentPut: [Set new])
		add: location.
	remoteNode
		ifNotNil: [remoteNode addReadWithin: scopeBlock at: location]
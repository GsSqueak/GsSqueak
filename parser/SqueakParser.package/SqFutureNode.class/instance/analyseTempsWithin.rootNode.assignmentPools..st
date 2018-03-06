closure analysis
analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools 
	"<BlockNode>"
	"<MethodNode>"
	"<Dictionary>"
	{receiver. futureDelta}
		, (futureArgs
				ifNil: [#()])
		do: [:node | node == nil
				ifFalse: [node
						analyseTempsWithin: scopeBlock
						rootNode: rootNode
						assignmentPools: assignmentPools]]
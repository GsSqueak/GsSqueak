closure analysis
analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools 
	"<BlockNode>"
	"<MethodNode>"
	"<Dictionary>"
	{receiver} , messages
		do: [:node | node
				analyseTempsWithin: scopeBlock
				rootNode: rootNode
				assignmentPools: assignmentPools]
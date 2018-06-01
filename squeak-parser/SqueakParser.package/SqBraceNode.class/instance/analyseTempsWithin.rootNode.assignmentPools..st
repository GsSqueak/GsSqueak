closure analysis
analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools 
	"<BlockNode>"
	"<MethodNode>"
	"<Dictionary>"
	elements
		do: [:node | node
				analyseTempsWithin: scopeBlock
				rootNode: rootNode
				assignmentPools: assignmentPools]
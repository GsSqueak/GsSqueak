closure analysis
analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools 
	"<BlockNode>"
	"<MethodNode>"
	"<Dictionary>"
	self addReadWithin: scopeBlock at: rootNode locationCounter
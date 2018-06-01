closure analysis
analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools 
	"<BlockNode>"
	"<MethodNode>"
	"<Dictionary>"
	"N.B. since assigment happens _after_ the value is evaluated the value
	is sent the message _first_."
	value
		analyseTempsWithin: scopeBlock
		rootNode: rootNode
		assignmentPools: assignmentPools.
	variable
		beingAssignedToAnalyseTempsWithin: scopeBlock
		rootNode: rootNode
		assignmentPools: assignmentPools